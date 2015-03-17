class UsersController < ApplicationController
  before_filter :authorize

  def show
    @orders = Order.where(user_id: current_user.id)
  end

  def quantity_of_item(item, order)
    ItemOrder.where(item_id: item.id, order_id: order.id)[0].quantity
  end
  helper_method :quantity_of_item

  def line_item_price(item, order)
    item.price * quantity_of_item(item, order)
  end
  helper_method :line_item_price

  def order_completed_or_cancelled?(order)
    order.status == "cancelled" || order.status == "completed"
  end
  helper_method :order_completed_or_cancelled?

  private

  def authorize
    if current_user.nil?
      redirect_to login_path, alert: "You must sign in"
    end
  end
end
