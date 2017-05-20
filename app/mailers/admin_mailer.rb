class AdminMailer < ApplicationMailer
  default from: 'doublehranch.engineering@gmail.com'
  layout 'template'
  
  def template(user)
    template = EmailTemplate.find(details[:template_id])
    @user = user
    @email = user.email
    @body = template.body
    @subject = template.subject
    mail(to: @email,
    bcc: "doublehranch.engineering@gmail.com",
    subject: @subject)
  end
end
