desc "create test accounts"
task :test_accounts => :environment do
  100.times do |i|
    FactoryGirl.create(:user, username: (i+1).to_s, password: "hogehoge", role: :attendee)
  end
  FactoryGirl.create(:user, username: "admin", password: "admin", role: :admin)
  puts "done."
end
