require "rails_helper"

RSpec.describe "user can find things by category", type: :feature do
  xit "can click on a category tag on the menu page" do
    item = create(:item)
    category = create(:category)
    item.categories << category
    item.save!

    visit "/menu"
    click_link_or_button("Specials")
    assert page.current_path == menu_item_name_path
  end

  it "can see different category pages" do
    item = create(:item)
    category = create(:category)
    item.categories << category
    item.save!

    visit "/menu/category/Specials"
    expect(page).to have_content("Salted Caramel Peanut Butter Cup")
  end
end
