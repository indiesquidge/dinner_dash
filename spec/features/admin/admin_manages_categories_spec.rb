require "rails_helper"

RSpec.describe "admin manages categories", type: :feature do
  it "must be admin to access create categories page" do
    create_admin_user
    visit new_menu_category_path
    expect(page).to have_content("Please enter your new category")
  end

  it "user cannot access create categories page" do
    create(:user)
    visit new_menu_category_path
    expect(page).to have_content("You are not authorized to access this page")
  end

  it "can create new categories" do
    create_admin_user
    visit new_menu_category_path
    fill_in "category[name]", with: "gluten-free"
    click_link_or_button "Submit"
    assert page.current_path == "/menu/categories"
    expect(page).to have_content("New category has been created!")
  end

  it "cannot create category without valid name" do
    create_admin_user
    visit new_menu_category_path
    fill_in "category[name]", with: ""
    click_link_or_button "Submit"
    expect(page).to have_content("must be filled in.")
  end

  it "cannot create duplicate categories" do
    create_admin_user
    visit new_menu_category_path
    fill_in "category[name]", with: "gluten-free"
    click_link_or_button "Submit"
    visit new_menu_category_path
    fill_in "category[name]", with: "gluten-free"
    click_link_or_button "Submit"
    expect(page).to have_content("of this category already exists!")
  end

  it "can add categories to new items" do
    create_admin_user
    visit edit_menu_item_path
    fill_in "category[name]", with: "gluten-free"
    click_link_or_button "Submit"
    expect(page).to have_content("Item has been successfully updated!")
  end

  it "can add categories to existing items" do
    create_admin_user
    visit edit_menu_item_path
    fill_in "category[name]", with: "gluten-free"
    click_link_or_button "Submit"
    expect(page).to have_content("Item has been successfully updated!")
  end

# Administrator can add categories to new items
# As an Administrator
# When I visit edit_menu_item_path
# And I choose categories for that item.
# And I see a message 'Your item has been updated."
# Then that item is associated with those categories

# As an Administrator
# When I visit /admin/menu
# And I click 'Edit Item'
# And I am directed to /admin/menu/item/:name/edit
# And I choose no categories for that item
# Then I see a message 'Please choose at least one category."


  def create_admin_user
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

end