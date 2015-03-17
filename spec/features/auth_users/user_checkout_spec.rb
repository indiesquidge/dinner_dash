require 'rails_helper'

RSpec.feature "user tries to checkout cart", type: :feature do
  it "will create a new order when they checkout" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    create_item_and_add_to_cart
    visit cart_path
    click_link_or_button("Checkout")
    expect(page).to have_content("paid")
    save_and_open_page
    expect(page).to have_content("salted caramel peanut butter cup")
  end

  def create_item_and_add_to_cart
    create(:item)
    visit menu_path
    click_link_or_button "Add to Cart"
  end

end
