require 'spec_helper'

describe "speaks/index" do
  before(:each) do
    assign(:speaks, [
      stub_model(Speak,
        :user => nil,
        :text => "MyText"
      ),
      stub_model(Speak,
        :user => nil,
        :text => "MyText"
      )
    ])
  end

  it "renders a list of speaks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
