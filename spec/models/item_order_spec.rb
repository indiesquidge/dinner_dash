require "rails_helper"

RSpec.describe ItemOrder, type: :model do
  it "is valid and has a default quantity" do
    item_order = create(:item_order)
    expect(item_order.quantity).to eq(1)
  end

  it "is invalid with a quantity of 0" do
    item_order = build(:item_order, quantity: 0)
    item_order.save
    expect(item_order.id).to be_nil
  end

  it "responds to items and orders" do
    item_order = create(:item_order)
    expect(item_order).to respond_to(:item)
    expect(item_order).to respond_to(:order)
  end
end
