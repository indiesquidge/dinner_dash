require "rails_helper"

RSpec.describe "user can find things by category", type: :feature do
  it "can click on a category tag on the menu page" do
    category = create(:category)
    item = create(:item)
    item.categories << category

    visit "/menu"
    within(".items") do
      click_link_or_button("Specials")
    end
    assert page.current_path == "/menu/categories/specials"
  end

  it "can see different category pages" do
    category = create(:category)
    item = create(:item)
    item.categories << category

    visit "/menu/categories/specials"
    expect(page).to have_content("salted caramel peanut butter cup")
  end

  it "user cannot access create categories page" do
    create(:user)
    visit new_menu_category_path
    expect(page).to have_content("You are not authorized to access this page")
  end
end
