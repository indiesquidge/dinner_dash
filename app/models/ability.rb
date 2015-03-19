class Ability
  include CanCan::Ability

  def initialize(current_user)
    current_user ||= User.new
    can :read, User, id: current_user.id

    if current_user.admin?
      can :manage, :all
    end
  end
end
