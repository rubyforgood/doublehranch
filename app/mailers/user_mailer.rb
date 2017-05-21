class AdminMailer < ApplicationMailer
  def welcome(user_id)
    user = User.find(user_id)
    subject = "Welcome to our awesome app!"
    merge_vars = {
      "FIRST_NAME" => user.first_name,
    }
    body = mandrill_template("test", merge_vars)
    send_mail(user.email, subject, body)
  end
end
