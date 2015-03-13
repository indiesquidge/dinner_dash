require "rails_helper"

RSpec.feature "Authenticated user", type: :feature do
  it "can logout" do
    create(:user)

    visit account_path
    fill_in "session[email]", with: "richard@example.com"
    fill_in "session[password]", with: "hello"
    click_link_or_button "Login"
    visit account_path
    click_link_or_button "Sign Out"
    within ("#flash_notice") do
      expect(page).to have_content("Goodbye")
    end
    visit account_path
    within ("#flash_alert") do
      expect(page).to have_content("You must log in")
    end
  end
end
