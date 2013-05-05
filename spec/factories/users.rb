# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username){|n| n}
    password { 8.times.map{"abcdefghjkmnpqrtuvwxyzABCDEFGHJKLMNPQRTUVWXY346789".split("").sample}.join }
    #nickname { "name_#{username}" }
    #salt { SecureRandom.base64(3) }
    #crypted_password { User.encrypt(password , salt) }
  end
end
