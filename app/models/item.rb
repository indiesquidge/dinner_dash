class Item < ActiveRecord::Base
  has_many :item_categories
  has_many :categories, through: :item_categories
  validates :name, presence: true, uniqueness: true
  validates :description, :price, presence: true
end
