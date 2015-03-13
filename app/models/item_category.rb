class ItemCategory < ActiveRecord::Base
  validates :item_id, :category_id, presence: true

  belongs_to :item
  belongs_to :category
end
