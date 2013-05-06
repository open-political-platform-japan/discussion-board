# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username){|n| n}
    password { 8.times.map{"abcdefghjkmnpqrtuvwxyzABCDEFGHJKLMNPQRTUVWXY346789".split("").sample}.join }
    trait(:admin)   { role :admin }
    trait(:attendee){ role :attendee }
  end
end
