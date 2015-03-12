class CartItemsController < ApplicationController
  def create
    item = Item.find_by(parameterized_name: params[:item])
    @cart.add_item(item)

    session[:cart] = @cart.data
    flash[:notice] = "You have #{pluralize(@cart.item_quantity(item), item.name)} in your cart."
    redirect_to menu_path
  end

  def index
    @cart
  end
end
