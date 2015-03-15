require "rails_helper"
require "support/factory_girl"

RSpec.feature "Authenticated user", type: :feature do
  it "should not be able to visit admin dashboard" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit admin_dashboard_path
    within ("div.alert-warning") do
      expect(page).to have_content("Unauthorized")
    end
    expect(page).to have_content("Menu")
  end
end
