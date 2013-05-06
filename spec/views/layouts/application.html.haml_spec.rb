require 'spec_helper'

describe "layouts/application.html.haml" do
  subject { render; response.body }
  before do
    controller.stub(current_user: user)
    #view.stub(current_user: user)
    assign(:current_ability, Ability.new(user))
  end
  context "without login" do
    let(:user){ nil }
    it { should_not have_selector :a, href: new_speak_path }
    it { should_not have_xpath "//a[contains(@href,'/admin/')]" }
  end
  context "with role=none login" do
    let(:user){ create(:user) }
    it { should_not have_selector :a, href: new_speak_path }
    it { should_not have_xpath "//a[contains(@href,'/admin/')]" }
  end
  context "with attendee login" do
    let(:user){ create(:user, :attendee) }
    it { should have_selector :a, href: new_speak_path }
    it { should_not have_xpath "//a[contains(@href,'/admin/')]" }
  end
  context "with admin login" do
    let(:user){ create(:user, :admin) }
    it { should have_selector :a, href: admin_users_path }
  end
end
