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
        can [:create, :update], :speaks, user_id: user.id
        can :access, :all
      when :attendee
        can :vote, :speaks
        can [:create], :speaks, user_id: user.id unless Configurable.stop_speaking
        can [:update], :speaks do |s|
          s.user_id == user.id && 1.minutes.ago < s.created_at
        end
        can [:create, :update], :users, id: user.id
      else
        #can [:vote], :speaks, user_id: user.id
      end
    end
  end
end
