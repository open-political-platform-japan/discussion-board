require 'spec_helper'

describe "speaks/show" do
  before(:each) do
    @speak = assign(:speak, create(:speak))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(@speak.text)
  end
end
