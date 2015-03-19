require "rails_helper"

RSpec.describe "user managing cart", type: :feature do
  it "adds items to cart" do
    create_item_and_add_to_cart
    expect(page).to have_content("in your cart.")
  end

  it "views their cart" do
    create_item_and_add_to_cart
    visit cart_path
    expect(page).to have_content("Salted Caramel Peanut Butter Cup")
  end

  it "sees the correct quantity for a specific item" do
    create_item_and_add_to_cart
    2.times { click_link_or_button "Add to Cart" }
    visit cart_path
    expect(page).to have_content("Quantity: 3")
  end

  it "allows users to remove things from their cart" do
    create_item_and_add_to_cart
    visit cart_path
    click_link('', href: '/cart_items/1')
    expect(page).to have_content("The item has been removed from your cart")
    expect(page).to_not have_content("Salted Caramel")
  end

  it "allows users to increase the quantity of an item in their cart" do
    create_item_and_add_to_cart
    visit cart_path
    click_link("", href: "/cart_items?item=salted-caramel-peanut-butter-cup")
    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content("12.00")
  end

  it "allows user to delete all of one item at once" do
    create_item_and_add_to_cart
    visit cart_path
    click_link("", href: "/cart_items?item=salted-caramel-peanut-butter-cup")
    click_link_or_button("Remove All")
    expect(page).to have_content("Total Items: 0")
  end

  it "can sign in and the cart should not change" do
    create_item_and_add_to_cart
    visit cart_path
    expect(page).to have_content("Quantity: 1")
    visit account_path
    user_sign_in
    visit cart_path
    expect(page).to have_content("Quantity: 1")
  end

  private

  def create_item_and_add_to_cart
    create(:item)
    visit menu_path
    click_link_or_button "Add to Cart"
  end

  def user_sign_in
    fill_in "session[email]", with: "richard@example.com"
    fill_in "session[password]", with: "password"
    within("form") { click_link_or_button "Sign in" }
  end
end
