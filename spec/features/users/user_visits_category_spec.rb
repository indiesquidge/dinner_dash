require "rails_helper"

RSpec.describe "user can find things by category", type: :feature do
  it "can click on a category tag on the menu page" do
    category = create(:category)
    create(:item, categories: [category])

    visit "/menu"
    click_link_or_button("Specials")
    assert page.current_path == "/menu/categories/specials"
  end

  it "can see different category pages" do
    category = create(:category)
    create(:item, categories: [category])

    visit "/menu/categories/specials"
    expect(page).to have_content("salted caramel peanut butter cup")
  end
end
