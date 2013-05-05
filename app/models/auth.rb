class Auth < ActiveRecord::Base
  belongs_to :user
  attr_accessible :omni_hash, :provider, :uid
end
