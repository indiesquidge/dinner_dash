class Category < ActiveRecord::Base

  has_many :item_categories
  has_many :items, through: :item_categories
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 42 }

end