class Status < ActiveRecord::Base
  validates :current_type, presence: true
  has_many :orders
end
