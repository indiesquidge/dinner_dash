require "rails_helper"
require "support/factory_girl"

RSpec.describe Order, type: :model do
  it "is valid" do
    order = create(:order)
    expect(order).to be_valid
  end

  it "is invalid without a status" do
    order = build(:order, status: nil)
    expect(order).not_to be_valid
  end

  it "is associated with a user" do
    order = create(:order)
    expect(order).to respond_to(:user)
  end

  it "is associated with items" do
    order = create(:order)
    item = create(:item)
    order.items << item
    expect(order.items).to eq([item])
  end
end
