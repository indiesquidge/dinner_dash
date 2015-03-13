require "rails_helper"
require "support/factory_girl"

RSpec.describe ItemCategory, type: :model do
  it "is valid" do
    item_category = create(:item_category)
    expect(item_category).to be_valid
  end

  it "is invalid without an item_id" do
    item_category = build(:item_category, item_id: nil)
    expect(item_category).not_to be_valid
  end

  it "is invalid without a category_id" do
    item_category = build(:item_category, category_id: nil)
    expect(item_category).not_to be_valid
  end

  it "associates an item with a category" do
    item = create(:item)
    expect(item).to respond_to(:categories)
  end

  it "associates a category with an item" do
    category = create(:category)
    expect(category).to respond_to(:items)
  end

  it "allows an item to call categories" do
    item = create(:item)
    category = create(:category)
    item.categories << category
    expect(item.categories.first.name).to eq("specials")
  end

  it "creates the join table correctly" do
    item = create(:item)
    category = create(:category)
    item.categories << category
    expect(ItemCategory.first.item_id).to eq(1)
    expect(ItemCategory.first.category_id).to eq(1)
  end
end
