require "rails_helper"

RSpec.feature "user visits account", type: :feature do
  it "can see order details and click on order items" do
    user = create(:user)
    order = create(:order)
    item = create(:item)
    order.items << item
    user.orders << order
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit account_path
    expect(page).to have_content("1 Salted Caramel Peanut Butter Cup: $6.00")
    expect(page).to have_content("cancelled")
    expect(page).to have_content("March 14, 2015, 3:08 PM")
    expect(page).to have_content("cancelled as of")
    click_link_or_button("Salted Caramel Peanut Butter Cup")
    expect(page).to have_content("Salted caramel ice cream with chopped peanut butter cups")
  end
end
