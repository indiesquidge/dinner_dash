require "rails_helper"

RSpec.describe "user visits website", type: :feature do
  it "can see all items on the menu page" do
    create(:item)
    visit "/menu"
    expect(page).to have_content("Salted Caramel Peanut Butter Cup")
  end

  it "can see store info on the home page" do
    visit "/"
    expect(page).to have_content("Welcome")
  end

  it "cannot see items that are retired" do
    create(:item, :retired)
    visit menu_path
    expect(page).not_to have_content("Salted Caramel Peanut Butter Cup")
  end
end
