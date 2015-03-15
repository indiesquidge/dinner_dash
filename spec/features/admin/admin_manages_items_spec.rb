require "rails_helper"

RSpec.describe "admin managing items", type: :feature do
  it "can create new item" do
    create(:user)
    visit new_menu_item_path
    fill_in "item[name]", with: "fudge"
    fill_in "item[description]", with: "double chocolate"
    fill_in "item[price]", with: "600"
    click_link_or_button "Create"
    assert page.current_path == "/menu/items/fudge"
    expect(page).to have_content("New item has been created!")
  end
end
