require "rails_helper"

RSpec.describe "user visits a category page", type: :feature do
  xit "can see categories" do
    item = create(:item)
    category = create(:category)
    item.categories << category
    item.save!
    binding.pry
    visit "/menu/specials"
    expect(page).to have_content("Salted Caramel Peanut Butter Cup")
  end
end
