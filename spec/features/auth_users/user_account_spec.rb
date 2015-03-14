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
    expect(page).to have_content("salted caramel peanut butter cup")
    expect(page).to have_content("$600")
    expect(page).to have_content("ordered")
    click_link_or_button("salted caramel peanut butter cup")
    expect(page).to have_content("Salted caramel ice cream with chopped peanut butter cups")
  end
end
