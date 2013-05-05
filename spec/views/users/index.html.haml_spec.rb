require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :key => "Key",
        :nickname => "Nickname",
        :spam => false
      ),
      stub_model(User,
        :key => "Key",
        :nickname => "Nickname",
        :spam => false
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
