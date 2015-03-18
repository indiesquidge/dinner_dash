require "rails_helper"

RSpec.describe "user visits website", type: :feature do
  it "can see all items on the menu page" do
    create(:item)
    visit "/menu"
    expect(page).to have_content("Salted Caramel Peanut Butter Cup")
  end

  it "can see store info on the home page" do
    visit '/'
    expect(page).to have_content("Hours")
  end
end
