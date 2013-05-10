require 'spec_helper'

describe "speaks/new" do
  before(:each) do
    assign(:speak, stub_model(Speak,
      :user => nil,
      :text => "MyText"
    ).as_new_record)
  end

  it "renders new speak form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", speaks_path, "post" do
      assert_select "textarea#speak_text[name=?]", "speak[text]"
    end
  end
end
