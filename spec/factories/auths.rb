# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auth do
    user nil
    provider "MyString"
    uid "MyString"
    omni_hash "MyText"
  end
end
