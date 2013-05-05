require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :key => "MyString",
      :nickname => "MyString",
      :spam => false
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_key[name=?]", "user[key]"
      assert_select "input#user_nickname[name=?]", "user[nickname]"
      assert_select "input#user_spam[name=?]", "user[spam]"
    end
  end
end
