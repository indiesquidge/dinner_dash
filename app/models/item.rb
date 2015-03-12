class Item < ActiveRecord::Base
  has_many :item_categories
  has_many :categories, through: :item_categories
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

  private

  def downcase_name
    return if name.nil?
    name.downcase!
  end
end
