# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||=User.new
    can :read, Product, public: true
    can :read, Company, public: true
    can :read, Category, public: true
     if user.present?
      can :create, Order
      can :read, Order, user_id: user.id
     end
     can :manage, :all if user.role=="admin"
  end
end
