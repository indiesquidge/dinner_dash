require "rails_helper"
require "support/factory_girl"

RSpec.feature "Unauthenticated user", type: :feature do
  it "cannot view account page until logged in" do
    visit account_path
    within ("#flash_alert") do
      expect(page).to have_content("You must log in")
    end
    expect(page).to have_content("Sign In")
    login
    within ("#flash_notice") do
      expect(page).to have_content("Login successful")
    end
    expect(page).to have_content("Account Settings")
  end

  it "cannot login with incorrect email or password" do
    create(:user)
    visit login_path
    fill_in "session[email]", with: "richard@example.com"
    fill_in "session[password]", with: "incorrect"
    click_link_or_button "Log In"
    within ("#flash_error") do
      expect(page).to have_content("Invalid login")
    end
    expect(page).to have_content("Login")
  end

  it "can logout if already logged in" do
    visit login_path
    login
    click_link_or_button "Sign Out"
    within ("#flash_notice") do
      expect(page).to have_content("Goodbye")
    end
    within (".navbar") do
      expect(page).to have_content("Sign In")
    end
  end

  private

  def login
    create(:user)
    fill_in "session[email]", with: "richard@example.com"
    fill_in "session[password]", with: "hello"
    click_link_or_button "Log In"
  end
end
