require "rails_helper"

RSpec.describe "cart feature", type: :feature do
  it "allows users to add items to their cart" do
  # As an Unauthenticated User
  # When I visit /menu
  # And I click “Add to Cart” on a particular listed item
  # And I see a flash alert that “The item has been added to your cart”
  # Then I should see the cart size increase by one item
    create(:item)
    visit "/menu"
    click_link_or_button "Add to Cart"
    expect(page).to have_content("Item successfully added to cart")
  end

  it "allows users to view their cart" do
  # As an Unauthenticated User
  # When I visit /cart
  # Then I should see all items in my Cart
    create(:item)
    visit "/menu"
    click_link_or_button "Add to Cart"
    click_link_or_button "Add to Cart"

    expect(page).to have_content("Item successfully added to cart")



  end

  # it "allows users to remove things from their cart" do
  # As an Unauthenticated User
  # When I visit /cart
  # And I click “Remove from Cart” on an Item
  # And I see a flash alert that “The item has been removed from your cart”
  # And I see the item disappear from my Cart
  # Then I should see the cart size decrease by one item
  # end

  # it "allows users to view their cart" do
  # end

  # it "allows users to increase the quantity of an item in their cart" do
  # As an Unauthenticated User
  # When I visit /cart
  # And I increase the quantity of an item in my cart
  # Then the size of my cart should increase by one
  # end




end
