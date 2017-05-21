class AdminMailer < ApplicationMailer
  def send_template(reply_to_name, sender, recipient, template)
    @recipient = recipient
    @body = template.body.gsub(/%RECIPIENT_NAME%/, recipient.friendly_name).gsub(/%VERIFY_URL%/, 'test.com').gsub(/%REPLY_TO_NAME%/, reply_to_name)
    mail(to: recipient.email,
         from: sender.email, 
         subject: template.subject).deliver
  end
end
