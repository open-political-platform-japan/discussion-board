require 'spec_helper'

describe "Users" do
  before do
    @user = create :user
  end
  describe "GET /users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get user_path(@user)
      response.status.should be(200)
    end
  end
end
