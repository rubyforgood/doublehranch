class EmailTemplatesController < ApplicationController

  def index
    @email_templates = EmailTemplate.all
  end

  def new
    @email_template = EmailTemplate.new
  end

  def create
    @email_template = EmailTemplate.new(email_template_params)
    if @email_template.save
      flash[:success] = 'Your email template has been saved!'
      render 'index'
    else
      flash.now[:alert] = 'Your email template is invalid. Please try again.'
      render 'new'
    end
  end

  private def email_template_params
    params.require(:email_template).permit(:body, :label, :subject)
  end
end

