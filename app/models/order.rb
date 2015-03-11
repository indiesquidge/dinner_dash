class Order < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :status
end
