class Ability
  include CanCan::Ability

  def initialize(user)

    if user
      can :read, Comment
      can [:create, :update, :delete], Comment, user: user
    end

  end
end
