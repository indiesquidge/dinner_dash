require "rails_helper"
require "support/factory_girl"

RSpec.feature "Unauthenticated user", type: :feature do
  it "cannot view account page until logged in" do
    visit account_path
    within ("div.alert-warning") do
      expect(page).to have_content("You must sign in")
    end
    expect(page).to have_content("Sign in")
    sign_in
    within ("div.alert-info") do
      expect(page).to have_content("Sign in successful")
    end
    expect(page).to have_content("Account")
  end

  it "cannot sign_in with incorrect email or password" do
    create(:user)
    visit login_path
    fill_in "session[email]", with: "richard@example.com"
    fill_in "session[password]", with: "incorrect"
    within("form") { click_link_or_button "Sign in" }
    within ("div.alert-danger") do
      expect(page).to have_content("Invalid")
    end
    expect(page).to have_content("Sign in")
  end

  it "can logout if already logged in" do
    visit login_path
    sign_in
    click_link_or_button "Sign out"
    within ("div.alert-info") do
      expect(page).to have_content("Signed out")
    end
    within (".navbar") do
      expect(page).to have_content("Sign in")
    end
  end

  private

  def sign_in
    create(:user)
    fill_in "session[email]", with: "richard@example.com"
    fill_in "session[password]", with: "hello"
    within("form") { click_link_or_button "Sign in" }
  end
end
