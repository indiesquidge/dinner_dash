require "rails_helper"

RSpec.feature "user tries to checkout cart", type: :feature do
  it "will create a new order when they checkout" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    create_item_and_add_to_cart
    visit cart_path
    click_link_or_button("Checkout")
    expect(page).to have_content("paid")
    expect(page).to have_content("Salted Caramel Peanut Butter Cup")
  end

  it "will be redirected to login if they are not authenticated" do
    create_item_and_add_to_cart
    visit cart_path
    click_link_or_button("Checkout")
    within("div.alert-danger") do
      expect(page).to have_content("You must sign in if you want to place an order.")
    end
    expect(current_path).to eq(login_path)
  end

  def create_item_and_add_to_cart
    create(:item)
    visit menu_path
    click_link_or_button "Add to Cart"
  end
end
