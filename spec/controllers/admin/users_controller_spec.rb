require 'spec_helper'

describe Admin::UsersController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:user) }
  let(:valid_session) { { user_id: @user.id } }

  before do
    @user = FactoryGirl.create(:user, :admin)
  end

  describe "post create" do
    subject { post :create, {users: "10,hogehoge\n12,fugafuga"}, valid_session }
    it "creates 2 users" do
      expect{subject}.to change{User.count}.by(2)
    end
    it "creates users" do
      subject
      expect(controller.login("10", "hogehoge")).not_to be_nil
      expect(controller.login("12", "fugafuga")).not_to be_nil
    end
  end
end
