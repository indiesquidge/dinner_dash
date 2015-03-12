class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActionView::Helpers::TextHelper

  def load_cart
    @cart = Cart.new(session[:cart])
  end
  before_action :load_cart
end
