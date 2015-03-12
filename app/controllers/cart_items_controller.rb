class CartItemsController < ApplicationController
  def create
    item = Item.find(params[:item])
    @cart.add_item(item)
    session[:cart] = @cart.data
    flash[:notice] = "You have #{pluralize(@cart.count_of(item), item.name)} in your cart."
    redirect_to menu_path
  end

  def index
    @cart
  end
end