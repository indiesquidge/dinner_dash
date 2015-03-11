require "rails_helper"
require "support/factory_girl"

RSpec.describe Order, type: :model do
  it "is valid" do
    order = create(:order)
    expect(order).to be_valid
  end

  it "is associated with a user" do
    order = create(:order)
    expect(order).to respond_to(:user)
  end

  it "is associated with a status" do
    order = create(:order)
    expect(order).to respond_to(:status)
  end
end
