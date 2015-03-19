class Item < ActiveRecord::Base
  has_many :item_categories
  has_many :categories, -> { uniq }, through: :item_categories
  has_many :item_orders
  has_many :orders, through: :item_orders

  scope :active_items, -> { where(status: "active").order_by_id }
  scope :retired_items, -> { where(status: "retired").order_by_id }

  validates :name, presence: true, uniqueness: true
  validates :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  before_validation :parameterize, :downcase_name

  has_attached_file :image, styles: { large: "500x340>", medium: "250x170>", thumb: "100x100>" }, default_url: "cookie-monster.jpg"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

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

  def self.order_by_id
    order(:id).reverse
  end

  def downcase_name
    return if name.nil?
    name.downcase!
  end
end
