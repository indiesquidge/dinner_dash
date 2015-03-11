class Category < ActiveRecord::Base

  validates :name, presence: true
  validates :name, length: { maximum: 42 }

end
