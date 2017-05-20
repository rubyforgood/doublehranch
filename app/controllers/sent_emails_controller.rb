class SentEmailsController < ApplicationController
  before_action :authenticate_user!

  def index
    @sent_emails = SentEmail.all
  end

  def new
    @sent_email = SentEmail.new
  end

  def create
    @sent_email = SentEmail.new(sent_email_params)
  end

  private def sent_email_params
    params.require(:sent_email).permit(:reply_to_name, :reply_to_email, :template_id)
  end
end
