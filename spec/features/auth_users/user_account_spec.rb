require "rails_helper"

RSpec.feature "user visits account", type: :feature do
  it "can see all past orders" do
    user = create(:user)
    order = create(:order)
    item = create(:item)
    order.items << item
    user.orders << order
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit account_path
    expect(page).to have_content("salted caramel peanut butter cup")
  end
end
