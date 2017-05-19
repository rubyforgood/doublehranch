class EmailTemplatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @email_templates = EmailTemplate.all
  end

  def new
    @email_template = EmailTemplate.new
  end

  def create
    @email_template = EmailTemplate.new(email_template_params)
    @email_template.author_id = current_user.id
    if @email_template.save
      flash[:success] = 'Your email template has been saved!'
      redirect_to action: 'index'
    else
      flash.now[:alert] = 'Your email template is invalid. Please try again.'
      render 'new'
    end
  end

  private def email_template_params
    params.require(:email_template).permit(:body, :label, :subject)
  end
end

