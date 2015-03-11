require "rails_helper"
require "support/factory_girl"

RSpec.describe Category, type: :model do
  it "is invalid without a name" do
    category = Category.create
    expect(category).to_not be_valid
  end

  it "requires a name to be valid" do
    category = Category.create(name: "Specials")
    expect(category).to be_valid
  end

  it "is valid when created with factory_girl" do
    category = create(:category)
    expect(category).to be_valid
  end

  it "name has a maximum of 42 characters" do
    category1 = Category.create(name: "John Jacob Jingle Heimer Smith From Kentucky")
    category2 = Category.create(name: "Specials")

    expect(category1).to_not be_valid
    expect(category2).to be_valid
  end

  it "requires a unique name" do
    category1 = Category.create(name: "Specials")
    category2 = Category.create(name: "Specials")

    expect(category1).to be_valid
    expect(category2).to_not be_valid
  end
end
