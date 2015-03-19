class Ability
  include CanCan::Ability

  def initialize(current_user)
    current_user ||= User.new

    if current_user.admin?
      can :manage, :all
    end
  end
end
