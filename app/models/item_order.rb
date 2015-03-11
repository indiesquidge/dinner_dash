class ItemOrder < ActiveRecord::Base
  validates_numericality_of :quantity, greater_than: 0
  belongs_to :item
  belongs_to :order
end
