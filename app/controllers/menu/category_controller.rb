class Menu::CategoryController < ApplicationController
  def show
    @items = current_category.items
  end

  def current_category
    cat = Category.find_by(name: params[:id])
  end
  helper_method :current_category
end
