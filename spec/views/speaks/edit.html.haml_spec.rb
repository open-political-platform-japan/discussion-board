require 'spec_helper'

describe "speaks/edit" do
  before(:each) do
    @speak = assign(:speak, stub_model(Speak,
      :user => nil,
      :text => "MyText"
    ))
  end

  it "renders the edit speak form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", speak_path(@speak), "post" do
      assert_select "textarea#speak_text[name=?]", "speak[text]"
    end
  end
end
