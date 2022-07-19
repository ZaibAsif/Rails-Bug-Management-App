# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.manager?
      can :manage, Project 
      can :read, Bug
    elsif user.developer?
      can :read, Project
      # can :update, Bug
      can :read, Bug 
    else
      can :manage, Bug 
      can :read, Project 
    end
  end
end
