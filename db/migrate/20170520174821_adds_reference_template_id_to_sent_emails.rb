class AddsReferenceTemplateIdToSentEmails < ActiveRecord::Migration[5.1]
  def change
    add_reference :sent_emails, :email_template
  end
end
