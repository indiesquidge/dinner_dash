require "rails_helper"

RSpec.describe "user managing cart", type: :feature do
  it "adds items to cart" do
    create(:item)
    visit "/menu"
    click_link_or_button "Add to Cart"
    expect(page).to have_content("in your cart.")
  end

  it "views their cart" do
    create(:item)
    visit "/menu"
    click_link_or_button "Add to Cart" # think about stubbing values in the cart
    visit "/cart"
    expect(page).to have_content("salted caramel peanut butter cup")
  end

  it "sees the correct quantity for a specific item" do
    create(:item)
    visit "/menu"
    click_link_or_button "Add to Cart"
    click_link_or_button "Add to Cart"
    click_link_or_button "Add to Cart"
    visit "/cart"
    expect(page).to have_content("Quantity: 3")
    # factory girl? stubbing current user? wrap the cart in a method called cart instead of directly accessing the cart and that would allow me to stub the method the same way we stubbed current user before.
  end

  it "allows users to remove things from their cart" do
    create(:item)
    visit "/menu"
    click_link_or_button "Add to Cart"
    visit "/cart"
    click_link_or_button "Remove from Cart"
    expect(page).to have_content("The item has been removed from your cart")
    expect(page).to_not have_content("salted caramel")
  end

  it "allows users to increase the quantity of an item in their cart" do
    create(:item)
    visit "/menu"
    click_link_or_button "Add to Cart"
    visit "/cart"
    click_link_or_button "Add Another"
    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content("Total Items: 2")
  end
end
