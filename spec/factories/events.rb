# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    date "2012-04-21"
    location "UC Berkeley"
    name "Cal Day!"
  end
end
