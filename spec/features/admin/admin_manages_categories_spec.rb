require "rails_helper"

RSpec.describe "admin manages categories", type: :feature do
  it "must be admin to access create categories page" do
    create_admin_user
    visit new_menu_category_path
    expect(page).to have_content("Please enter your new category")
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
    expect(page).to have_content("this category already exists!")
  end

  it "can add categories to new items" do
    item = create(:item)
    category = create(:category)
    create_admin_user
    visit edit_menu_item_path(item)
    find(:css, "#category_ids_[value='#{category.id}']").set(true)
    click_link_or_button "Submit"
    expect(page).to have_content("Item has been successfully updated!")
  end

  it "can add categories to existing items" do
    create_admin_user
    item = create(:item)
    category = create(:category)
    visit edit_menu_item_path(item)
    find(:css, "#category_ids_[value='#{category.id}']").set(true)
    click_link_or_button "Submit"
    expect(page).to have_content("Item has been successfully updated!")
  end

  def create_admin_user
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
end
