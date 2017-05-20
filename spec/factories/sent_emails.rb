FactoryGirl.define do
  factory :sent_email do
    sender_id 1
    recipient_id 1
    time_sentls "2017-05-20 10:24:09"
    reply_to_name "MyString"
    reply_to_email ""
    status "MyString"
  end
end
