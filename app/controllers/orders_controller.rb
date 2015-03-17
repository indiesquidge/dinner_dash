class OrdersController < ApplicationController
  def create
    Order.create()
    redirect_to account_path
  end
end
