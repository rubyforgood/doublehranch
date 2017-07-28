FactoryGirl.define do
  factory :post do
    caption "MyString"
    user nil
    photo File.new(Rails.root + 'spec/fixtures/images/wow_so_cute.jpg')
  end
end
