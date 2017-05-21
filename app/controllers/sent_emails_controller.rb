class SentEmailsController < ApplicationController
  before_action :authenticate_user!

  def index
    @sent_emails = SentEmail.all
  end

  def new
    @sent_email = SentEmail.new
    @possible_senders = User.admins
    @groups = Position.all.pluck(:name).map {|p| "#{p}s"} << "Everyone"
  end

  def create
    reply_to_name = sent_email_params[:reply_to_name]
    sender = User.find(sent_email_params[:sender_id])
    template = EmailTemplate.find(sent_email_params[:email_template_id])
    recipient_group = params[:recipients] != "Everyone" ? User.positions(params[:recipients].downcase.chop) : User.all
    recipient_group.each do |recipient|
      AdminMailer.send_template(reply_to_name, sender, recipient, template).deliver
      @sent_email = SentEmail.new(reply_to_name: sent_email_params[:reply_to_name],
                                  reply_to_email: sender.email,
                                  sender_id: sender.id,
                                  recipient_id: recipient.id,
                                  email_template_id: template.id,
                                  reply_to_email: sender.email,
                                  reply_to_name: sender.full_name,
                                  status: "sent"
                                  )
    end
    
    if @sent_email.save
      flash[:success] = 'Email sent!'
      redirect_back fallback_location: email_templates_path
    else
      render 'new'
      flash[:notice] = 'There was a problem. Email not sent.'
    end
  end

  private 
  
  def sent_email_params
    params.require(:sent_email).permit(:reply_to_name, :reply_to_email, :email_template_id, :recipients, :sender_id)
  end
end
