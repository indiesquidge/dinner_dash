class Order < ActiveRecord::Base
  validates :user_id, :status, presence: true

  belongs_to :user
end
