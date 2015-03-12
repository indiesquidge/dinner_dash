require "rails_helper"
require "support/factory_girl"

RSpec.describe Category, type: :model do
  it "is valid" do
    category = create(:category)
    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category = build(:category, name: nil)
    expect(category).to_not be_valid
  end

  it "name has a maximum of 42 characters" do
    category1 = Category.create(name: "John Jacob Jingle Heimer Smith From Kentucky")
    category2 = Category.create(name: "Specials")

    expect(category1).to_not be_valid
    expect(category2).to be_valid
  end

  it "requires a unique name" do
    category = create(:category)
    category1 = build(:category)
    category1.save

    expect(category).to be_valid
    expect(category1).to_not be_valid
  end
end
