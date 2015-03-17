require "rails_helper"

RSpec.feature "Admin user", type: :feature do
  it "can visit the admin dashboard" do
    admin_visits_dashboard
    expect(page).to have_content("Admin Dashboard")
  end

  it "can see a list of all orders" do
    admin_visits_dashboard
    expect(page).to have_content("List of All Orders")
  end

  # it "can see a list of all orders" do
  #   admin_visits_dashboard
  #   click_link_or_button("View Order")
  #   expect(page).to have_content("Order Info")
  # end


  private

  def admin_visits_dashboard
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path
  end
end
