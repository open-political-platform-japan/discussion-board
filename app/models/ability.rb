class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :speaks
    can :access, :users
    can :access, :sessions
    if user
      case user.role
      when "admin"
        can :access, :all
      else
        can [:create], :speaks, user_id: user.id
      end
    end
  end
end
