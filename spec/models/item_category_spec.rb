require "rails_helper"
require "support/factory_girl"

RSpec.describe ItemCategory, type: :model do
  it "associates an item with a category" do
    item = create(:item)
    category = create(:category)
    expect(item).to respond_to(:categories)
  end

  it "associates a category with an item" do
    item = create(:item)
    category = create(:category)
    expect(category).to respond_to(:items)
  end

  it "allows an item to call categories" do
    item = create(:item)
    category = create(:category)
    item.categories << category
    expect(item.categories.first.name).to eq("Specials")
  end

  it "creates the join table correctly" do
    item = create(:item)
    category = create(:category)
    item.categories << category
    expect(ItemCategory.first.item_id).to eq(1)
    expect(ItemCategory.first.category_id).to eq(1)
  end
end
