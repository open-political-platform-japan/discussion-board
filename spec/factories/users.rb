# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username){|n| n.to_s}
    password { 'abcdefghjkmnpqrtuvwxyzABCDEFGHJKLMNPQRTUVWXY346789+-=!#$%&'.chars.sample(8).join }
    trait(:admin)   { role :admin }
    trait(:attendee){ role :attendee }
  end
end
