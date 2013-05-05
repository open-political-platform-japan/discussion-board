require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :key => "MyString",
      :nickname => "MyString",
      :spam => false
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_key[name=?]", "user[key]"
      assert_select "input#user_nickname[name=?]", "user[nickname]"
      assert_select "input#user_spam[name=?]", "user[spam]"
    end
  end
end
