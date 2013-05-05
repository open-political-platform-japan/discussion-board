require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :key => "Key",
      :nickname => "Nickname",
      :spam => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Key/)
    rendered.should match(/Nickname/)
    rendered.should match(/false/)
  end
end
