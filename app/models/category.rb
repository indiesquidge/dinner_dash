class Category < ActiveRecord::Base
  has_many :item_categories
  has_many :items, through: :item_categories
  validates :name, presence: true, uniqueness: true, length: { maximum: 42 }
end
