require "rails_helper"
require "support/factory_girl"

RSpec.describe Item, type: :model do

  it "is invalid without a name" do
    item = Item.create(description: "A salted caramel ice cream base with chopped peanut butter cups", price: 600)
    expect(item).to_not be_valid
  end

  it "is invalid without a description" do
    item = Item.create(name: "Salted Caramel Peanut Butter Cup", price: 600)
    expect(item).to_not be_valid
  end

  it "is invalid without a price" do
    item = Item.create(name: "Salted Caramel Peanut Butter Cup", description: "A salted caramel ice cream base with chopped peanut butter cups")
    expect(item).to_not be_valid
  end

  it "is not retired by default" do
    item = Item.create(name: "Salted Caramel Peanut Butter Cup", description: "A salted caramel ice cream base with chopped peanut butter cups", price: 600)
    expect(item.retired).to be_falsey
  end

  it 'is valid when created with factory_girl' do
    item = create(:item)
    expect(item).to be_valid
  end

  it "name must be unique" do
    item1 = item = Item.create(name: "Salted Caramel Peanut Butter Cup", description: "A salted caramel ice cream base with chopped peanut butter cups", price: 600)
    item2 = item = Item.create(name: "Salted Caramel Peanut Butter Cup", description: "A salted caramel ice cream base with chopped peanut butter cups", price: 600)
    expect(item2).to_not be_valid
  end

end