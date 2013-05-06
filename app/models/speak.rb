class Speak < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  attr_accessible :text
end
