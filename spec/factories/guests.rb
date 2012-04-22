# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :guest do
    name "MyString"
    phone 1
    email "MyString"
    note "MyText"
  end
end
