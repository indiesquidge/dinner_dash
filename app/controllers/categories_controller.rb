class CategoriesController < ApplicationController
  def show
    @items = current_category.items
  end

  def new
    @category = Category.new
    authorize! :new, @category
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = "New category has been created!"
      redirect_to menu_categories_path
    else
      flash[:error] = "#{@category.errors.full_messages.first}"
      redirect_to new_menu_category_path
    end
  end


  def index
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
