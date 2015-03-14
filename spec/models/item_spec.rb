require "rails_helper"
require "support/factory_girl"

RSpec.describe Item, type: :model do
  it 'is valid' do
    item = create(:item)
    expect(item).to be_valid
  end

  it "is invalid without a name" do
    item = build(:item, name: nil)
    expect(item).to_not be_valid
  end

  it "is invalid without a description" do
    item = build(:item, description: nil)
    expect(item).to_not be_valid
  end

  it "is invalid without a price" do
    item = build(:item, price: nil)
    expect(item).to_not be_valid
  end

  it "is active by default" do
    item = create(:item)
    expect(item.status).to eq("active")
  end

  it "name must be unique" do
    item1 = create(:item)
    item2 = build(:item)
    item2.save
    expect(item1).to be_valid
    expect(item2).to_not be_valid
  end

  it "is associated with orders" do
    item = create(:item)
    order = create(:order)
    item.orders << order
    expect(item.orders).to eq([order])
  end
end
