require "rails_helper"

RSpec.describe "admin managing items", type: :feature do
  it "must be admin to access create item page" do
    create_admin_user
    visit new_menu_item_path
    expect(page).to have_content("Please enter your new item")
  end

  it "user cannot access create item page" do
    create(:user)
    visit new_menu_item_path
    expect(page).to have_content("You are not authorized to access this page")
  end

  it "can create new item" do
    create_admin_user
    category = create(:category)
    visit new_menu_item_path
    fill_in "item[name]", with: "fudge"
    fill_in "item[description]", with: "double chocolate"
    fill_in "item[price]", with: "600"
    find(:css, "#category_ids_[value='#{category.id}']").set(true)
    click_link_or_button "Submit"
    assert page.current_path == "/menu/items/fudge"
    expect(page).to have_content("New item has been created!")
  end

  it "cannot create item without valid name" do
    create_admin_user
    visit new_menu_item_path
    fill_in "item[description]", with: "double chocolate"
    fill_in "item[price]", with: "600"
    click_link_or_button "Submit"
    assert page.current_path == "/menu/items/new"
    expect(page).to have_content("Attributes missing")
  end

  it "can access edit item from individual item page" do
    create_admin_user
    item = create(:item)
    item.categories << create(:category)
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
    create_admin_user
    item = create(:item)
    visit edit_menu_item_path(item)
    fill_in "item[name]", with: "fudge"
    fill_in "item[description]", with: ""
    fill_in "item[price]", with: "600"
    click_link_or_button "Submit"
    expect(page).to have_content("Attributes missing.")
  end

  it "cannot create item if no category is selected" do
    create_admin_user
    create(:item)
    visit new_menu_item_path
    fill_in "item[name]", with: "fudge"
    fill_in "item[description]", with: ""
    fill_in "item[price]", with: "600"
    click_link_or_button "Submit"
    within("div.alert-danger") do
      expect(page).to have_content("Attributes missing")
    end
  end

  xit "can upload photo when creating new item" do
    create_admin_user
    visit new_menu_item_path
    fill_in "item[name]", with: "fudge"
    fill_in "item[description]", with: "double chocolate"
    fill_in "item[price]", with: "600"
    # attach_file "item[image]", "app/assets/images/cookie-monster.jpg"
    click_link_or_button "Submit"
    expect(current_path).to eq("/menu/items/fudge")
    # expect(page).to have_css("img[alt='Cookie monster']")
  end

  it "can retire an item" do
    create_admin_user
    item = create(:item)
    item.categories << create(:category)
    visit edit_menu_item_path(item)
    select 'retired', from: 'item_status'
    click_link_or_button "Submit"
    expect(page).to have_content("Item has been successfully updated!")
    expect(item.reload.status).to eq("retired")
  end

  private

  def create_admin_user
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
end
