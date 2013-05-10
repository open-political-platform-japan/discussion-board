require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SpeaksHelper. For example:
#
# describe SpeaksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe SpeaksHelper do
  before do
    @speak = create :speak
    @user = @speak.user
  end
  describe "with_speak_link" do
    subject { helper.with_speak_link("テスト##{@speak.id}テスト") }
    it { should include(speak_path(@speak)) }
  end
end
