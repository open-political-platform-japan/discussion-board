require 'spec_helper'

describe "speaks/show" do
  before(:each) do
    @speak = assign(:speak, stub_model(Speak,
      :user => nil,
      :text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
