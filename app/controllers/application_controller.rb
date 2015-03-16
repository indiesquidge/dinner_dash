class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ActionView::Helpers::TextHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.message
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
end
