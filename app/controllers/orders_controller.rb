class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def cancel
    @order = Order.find(params[:id])
    @order.status = "cancelled"
    @order.save
    flash[:notice] = "Order cancelled."
    redirect_to :back
  end

  def paid
    @order = Order.find(params[:id])
    @order.status = "paid"
    @order.save
    flash[:notice] = "Order marked as paid."
    redirect_to :back
  end

  def complete
    @order = Order.find(params[:id])
    @order.status = "completed"
    @order.save
    flash[:notice] = "Order marked as completed."
    redirect_to :back
  end
end
