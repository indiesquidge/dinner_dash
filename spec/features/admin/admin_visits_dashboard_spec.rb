require "rails_helper"

RSpec.feature "Admin user", type: :feature do
  it "can visit the admin dashboard" do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path
    expect(page).to have_content("Admin Dashboard")
  end
end
