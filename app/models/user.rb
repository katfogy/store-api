class User < ApplicationRecord
  enum role: %i[user admin]
  after_initialize :set_default_role, :if =>:new_record?
  has_many :orders, dependent: :destroy
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
# if the signup and the role is not assigned it should be set by default as user
  def set_default_role
    self.role||=:user
  end
end
