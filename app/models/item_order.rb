class ItemOrder < ActiveRecord::Base
  validates :quantity, numericality: { greater_than: 0 }
  belongs_to :item
  belongs_to :order
end
