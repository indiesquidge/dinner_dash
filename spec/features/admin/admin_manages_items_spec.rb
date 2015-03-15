require "rails_helper"

RSpec.describe "admin managing items", type: :feature do
  it "can create new item" do
    create(:user)
    visit new_menu_item_path
    fill_in "item[name]", with: "fudge"
    fill_in "item[description]", with: "double chocolate"
    fill_in "item[price]", with: "600"
    click_link_or_button "Submit"
    assert page.current_path == "/menu/items/fudge"
    expect(page).to have_content("New item has been created!")
  end

  it "cannot create item without valid name" do
    visit new_menu_item_path
    fill_in "item[description]", with: "double chocolate"
    fill_in "item[price]", with: "600"
    click_link_or_button "Submit"
    assert page.current_path == "/menu/items/new"
    expect(page).to have_content("Attributes missing")
  end

  it "can modify item listings from individual item page" do
    create(:item)
    visit "/menu/items/salted-caramel-peanut-butter-cup"
    click_link_or_button "Edit Item"
    fill_in "item[name]", with: "fudge"
    fill_in "item[description]", with: "double chocolate"
    fill_in "item[price]", with: "600"
    click_link_or_button "Submit"
    assert page.current_path == "/menu/items/fudge"
    expect(page).to have_content("Item has been successfully updated!")
  end

  it "cannot modify item if attribute is missing" do
    item = create(:item)
    visit edit_menu_item_path(item)
    fill_in "item[name]", with: "fudge"
    fill_in "item[description]", with: ""
    fill_in "item[price]", with: "600"
    click_link_or_button "Submit"
    expect(page).to have_content("Attributes missing.")
  end



end
