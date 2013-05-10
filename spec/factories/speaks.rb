# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :speak do
    association :user, :attendee
    text "MyText"
  end
end
