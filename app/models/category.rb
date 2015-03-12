class Category < ActiveRecord::Base
  has_many :item_categories
  has_many :items, through: :item_categories
  validates :name, presence: true, uniqueness: true, length: { maximum: 42 }

  before_save :downcase_name

  def to_param
    "#{name.parameterize}"
  end

  def display_name
    name.capitalize
  end

  private

  def downcase_name
    name.downcase!
  end
end
