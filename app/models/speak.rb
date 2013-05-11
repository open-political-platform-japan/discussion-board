class Speak < ActiveRecord::Base
  acts_as_votable
  belongs_to :user

  validates :text, length: 3..Configurable.speak_length
end
