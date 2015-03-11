require "rails_helper"

RSpec.describe "user visits menu", type: :feature do
  it "can see all items" do
    create(:item)
    visit '/menu'
    expect(page).to have_content("Salted Caramel Peanut Butter Cup")
  end
end
