class Category < ActiveRecord::Base
  has_many :item_categories
  has_many :items, through: :item_categories
  validates :name, presence: { message: "must be filled in." },
        uniqueness: { message: "of this category already exists!" },
        length: { maximum: 42 }

  before_validation :parameterize, :downcase_name

  def to_param
    "#{name.parameterize}"
  end

  def parameterize
    name.to_param
  end

  def display_name
    name.capitalize
  end

  private

  def downcase_name
    return if name.nil?
    name.downcase!
  end
end
