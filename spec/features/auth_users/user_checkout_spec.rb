require 'rails_helper'

RSpec.feature "user tries to checkout cart", type: :feature do
  it "will create a new order when they checkout" do
    visit cart_path
    click_link_or_button("Checkout")
    #see javascript alert

  end

end
