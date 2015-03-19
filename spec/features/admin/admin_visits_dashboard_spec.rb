require "rails_helper"

RSpec.feature "Admin user", type: :feature do
  it "can visit the admin dashboard" do
    admin_visits_dashboard
    expect(page).to have_content("Admin Dashboard")
  end

  it "can see a happy message if there aren't any orders" do
    admin_visits_dashboard
    expect(page).to have_content("Cheer up!")
  end

  it "can view total number of orders by status" do
    create(:order)
    admin_visits_dashboard
    expect(page).to have_content("Cancelled 1")
  end

  it "can view customers emails" do
    create(:order)
    admin_visits_dashboard
    expect(page).to have_content("richard@example.com")
  end

  it "can link to individual orders" do
    create(:order)
    admin_visits_dashboard
    within("#cancelled") do
      click_link_or_button("Order 1")
    end
    expect(page).to have_content("Order 1 Information")
  end

  it "can filter orders by status type" do
    create(:order)
    admin_visits_dashboard
    click_link_or_button("Cancelled")
    expect(page).to have_content("Order 1")
  end

  it "can cancel individual orders which are currently ordered" do
    create(:order, :ordered)
    admin_visits_dashboard
    expect(page).to have_content("Ordered 1")
    expect(page).to have_content("Cancelled 0")
    click_link_or_button "Ordered"
    click_link_or_button "Cancel Order"
    expect(page).to have_content("Ordered 0")
    expect(page).to have_content("Cancelled 1")
  end

  it "can mark as paid orders which are ordered" do
    create(:order, :ordered)
    admin_visits_dashboard
    expect(page).to have_content("Ordered 1")
    expect(page).to have_content("Paid 0")
    click_link_or_button "Ordered"
    click_link_or_button "Mark as Paid"
    expect(page).to have_content("Ordered 0")
    expect(page).to have_content("Paid 1")
  end

  it "can mark as completed orders which are paid" do
    create(:order, :paid)
    admin_visits_dashboard
    expect(page).to have_content("Paid 1")
    expect(page).to have_content("Completed 0")
    click_link_or_button "Paid"
    click_link_or_button "Mark as Completed"
    expect(page).to have_content("Paid 0")
    expect(page).to have_content("Completed 1")
  end

  it "cancel individual orders which are currently paid" do
    create(:order, :paid)
    admin_visits_dashboard
    expect(page).to have_content("Paid 1")
    expect(page).to have_content("Cancelled 0")
    click_link_or_button "Paid"
    click_link_or_button "Cancel Order"
    expect(page).to have_content("Paid 0")
    expect(page).to have_content("Cancelled 1")
  end

  it "can click on button and see all items" do
    admin_visits_dashboard
    click_link_or_button("See All Items")
    expect(current_path).to eq(menu_path)
    expect(page).to have_content("Menu")
  end

  it "can click on button and see all categories" do
    admin_visits_dashboard
    click_link_or_button("See All Categories")
    expect(current_path).to eq(menu_categories_path)
    expect(page).to have_content("All Categories")
  end

  private

  def admin_visits_dashboard
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path
  end
end
