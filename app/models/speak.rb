class Speak < ActiveRecord::Base
  belongs_to :user
  attr_accessible :text
end
