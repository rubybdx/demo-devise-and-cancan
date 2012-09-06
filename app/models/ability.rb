class Ability
  include CanCan::Ability

  
  def initialize(user)
    @user = user || User.new  # for guest

    @user.roles.each { |role| send(role) }
  end

  def reader
      can :read, Comment
      can [:create, :update, :delete], Comment, user: user
  end

  def admin
    can :manage, :all
  end

end
