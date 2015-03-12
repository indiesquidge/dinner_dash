require "rails_helper"

RSpec.describe "user can find things by category", type: :feature do
  it "can click on a category tag on the menu page" do
    category = create(:category)
    create(:item, categories: [category])

    visit "/menu"
    click_link_or_button("Specials")
    assert page.current_path == "/menu/category/specials"
  end

  it "can see different category pages" do
    category = create(:category)
    create(:item, categories: [category])

    visit "/menu/category/specials"
    expect(page).to have_content("Salted Caramel Peanut Butter Cup")
  end
end
