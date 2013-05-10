require 'spec_helper'

describe "speaks/index" do
  before(:each) do
    @speaks = assign(:speaks, create_list(:speak, 2))
  end

  it "renders a list of speaks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "article > p", :text => @speaks[0].text, :count => 2
  end
end
