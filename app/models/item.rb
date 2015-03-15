class Item < ActiveRecord::Base
  has_many :item_categories
  has_many :categories, -> { uniq }, through: :item_categories
  has_many :item_orders
  has_many :orders, through: :item_orders

  validates :name, presence: true, uniqueness: true
  validates :description, :price, presence: true

  before_validation :parameterize, :downcase_name

  def to_param
    "#{name.parameterize}"
  end

  def parameterize
    return if name.nil?
    self.parameterized_name = name.parameterize
  end

  def display_name
    name.titleize
  end

  private

  def downcase_name
    return if name.nil?
    name.downcase!
  end
end
