require 'spec_helper'

describe User do
  before do
    @user = create :user
  end
  describe "display_name" do
    subject { @user.display_name }
    context "without nickname" do
      it { should include @user.username }
    end
    context "have nickname" do
      before { @user.nickname="test_nickname" }
      it { should eq "test_nickname" }
    end
  end
end
