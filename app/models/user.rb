class User < ActiveRecord::Base
  authenticates_with_sorcery!
  acts_as_voter
  ROLES = %w(admin attendee none)

  validates :username, uniqueness: true, allow_nil: true
  validates :nickname, length:{ in: 2..10, allow_nil: true}

  def role
    super.presence || 'none'
  end
  def display_name
    nickname.presence || "匿名_#{username}"
  end
end
