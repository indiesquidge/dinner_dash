class Order < ActiveRecord::Base
  validates :user_id, :status, presence: true
  has_many :item_orders
  has_many :items, through: :item_orders
  belongs_to :user

  def total_price
    items.inject(0) { |sum, item| sum + item.price }
  end
end
