class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  has_secure_password

  has_many :orders
end
