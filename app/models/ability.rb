class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.has_role?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
