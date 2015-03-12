require "rails_helper"
require "support/factory_girl"

RSpec.feature "Unauthenticated user", type: :feature do
  it "cannot view account" do
    visit "/account"
    expect(page).to have_content("Login")
    within ("#flash_alert") do
      expect(page).to have_content("You must log in")
    end
  end

  xit "can view account page after logging in" do

  end
end
