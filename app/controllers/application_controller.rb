class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ActionView::Helpers::TextHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, notice: exception.message
  end

  def load_cart
    @cart = Cart.new(session[:cart])
  end
  before_action :load_cart

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def format_time(time)
    time.strftime("%B %d, %Y, %l:%M %p")
  end
  helper_method :format_time

  def cart_data
    session[:cart] = @cart.data
  end
  helper_method :cart_data

  def current_category
    Category.find_by(name: params[:category_name])
  end
  helper_method :current_category

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

  def all_categories
    Category.all
  end
  helper_method :all_categories
end
