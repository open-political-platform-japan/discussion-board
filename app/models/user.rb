class User < ActiveRecord::Base
  authenticates_with_sorcery!
  ROLES = [:admin, :attendee]

  def role
    super.presence || 'none'
  end
  def display_name
    nickname.presence || "匿名_#{username}"
  end
end
