class Ability
  include CanCan::Ability

  def initialize(user)
    can :access, :helps
    can :read, :speaks
    can :access, :users
    can :access, :sessions
    if user
      case user.role.to_sym
      when :admin
        can :access, :all
      when :attendee
        can :vote, :speaks
        can [:create, :update], :speaks, user_id: user.id
        can [:create, :update], :users, id: user.id
      else
        #can [:vote], :speaks, user_id: user.id
      end
    end
  end
end
