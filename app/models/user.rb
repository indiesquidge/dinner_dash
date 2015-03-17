class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :role, presence: true
  has_secure_password

  enum role: %w(default admin)

  has_many :orders

  def full_name
    "#{first_name} #{last_name}"
  end
end
