require "rails_helper"
require "support/factory_girl"

RSpec.feature "Unauthenticated user", type: :feature do
  it "cannot view account" do
    visit account_path

    within ("#flash_alert") do
      expect(page).to have_content("You must log in")
    end
    expect(page).to have_content("Login")
  end

  it "can view account page after logging in" do
    visit account_path
    expect(page).to have_content("Login")

    create(:user)
    fill_in "session[email]", with: "richard@example.com"
    fill_in "session[password]", with: "hello"
    click_link_or_button "Login"

    within ("#flash_notice") do
      expect(page).to have_content("Login successful")
    end
    expect(page).to have_content("Account Settings")
  end
end
