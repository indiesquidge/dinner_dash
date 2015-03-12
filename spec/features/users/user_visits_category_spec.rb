require "rails_helper"

RSpec.describe "user visits a category page", type: :feature do
  it "can see categories" do
    item = create(:item)
    category = create(:category)
    item.categories << category
    item.save!
    visit "/menu/category/specials"
    expect(page).to have_content("Salted Caramel Peanut Butter Cup")
  end
end
