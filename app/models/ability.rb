# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||=User.new
    can :read, Products, public: true
    can :read, Campanies, public: true
    can :read, Categories, public: true
     if user.persisted?
      can :create, Order
      can :read, Order, user_id: user.id
     end
     can :manage, :all if user.role=="admin"
  end
end
