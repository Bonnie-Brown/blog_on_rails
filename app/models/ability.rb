# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    alias_action :create, :read, :update, :delete, :to => :crud


    can :crud, Post do |post|
      user == post.user
    end

    can :crud, Comment do |comment|
      user == comment.user
    end

    # can :update, User do |user|
    #   user == user
    # end

  end
end
