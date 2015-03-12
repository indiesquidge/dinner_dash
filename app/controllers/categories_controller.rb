class CategoriesController < ApplicationController
  def show
    @items = current_category.items
  end

  def current_category
    Category.find_by(name: params[:category_name])
  end
  helper_method :current_category
end
