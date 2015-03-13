require "rails_helper"
require "support/factory_girl"

RSpec.describe User, type: :model do
  it "is valid" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "is invalid without a first name" do
    user = build(:user, first_name: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a last name" do
    user = build(:user, last_name: nil)
    expect(user).not_to be_valid
  end

  it "is valid without a display name" do
    user = build(:user, display_name: nil)
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user = build(:user, password: nil)
    expect(user).not_to be_valid
  end

  it "has an array of orders" do
    user = create(:user)
    order = user.orders.create(user_id: user.id)
    expect(user.orders).to eq([order])
  end

  it "is invalid without a role" do
    user = build(:user, role: nil)
    expect(user).not_to be_valid
  end

  it "has an initial role of default" do
    user = create(:user)
    expect(user.role).to eq("default")
  end
end
