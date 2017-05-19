FactoryGirl.define do
  factory :user do
    sequence(:first_name)  { |n| "First#{n}" }
    sequence(:last_name)   { |n| "Last#{n}" }
    sequence(:email)       { |n| "user#{n}@example.com" }
    street_address         { Faker::Address.street_address }
    city                   { Faker::Address.city }
    state                  { Faker::Address.state }
    country                { Faker::Address.country }
    zip_code               { Faker::Address.zip_code }
    nickname               { Faker::Name.first_name }
    maiden_name            { Faker::Name.last_name }
    salutation             { Faker::Name.prefix }
    password 'hunter2'

    trait :admin do
      sequence(:email) { |n| "admin#{n}@example.com" }
      admin             true
    end
  end
end
    t.string "first_name"
    t.string "last_name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip_code"
    t.string "nickname"
    t.string "maiden_name"
    t.string "salutation"
    t.hstore "privacy_settings"
    t.boolean "admin", default: false
    t.string "email", default: "", null: false
