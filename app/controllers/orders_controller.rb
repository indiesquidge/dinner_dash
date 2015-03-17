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


  # def new
  #   @category = Category.new
  #   authorize! :new, @category
  # end

  # def create
  #   @category = Category.create(category_params)
  #   if @category.save
  #     flash[:success] = "New category has been created!"
  #     redirect_to menu_categories_path
  #   else
  #     flash[:error] = "#{@category.errors.full_messages.first}"
  #     redirect_to new_menu_category_path
  #   end
  # end


  # def index
  # end

  # private

  # def category_params
  #   params.require(:category).permit(:name)
  # end
end
