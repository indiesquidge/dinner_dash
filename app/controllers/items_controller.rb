class ItemsController < ApplicationController
  def show
    @item = Item.find_by(parameterized_name: params[:item_name])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:notice] = "New item has been created!"
      redirect_to menu_item_path(@item)
    else
      flash[:notice] = "Attributes missing"
      redirect_to new_menu_item_path
    end
  end

  def edit
    @item = Item.find_by(parameterized_name: params[:item_name])
  end

  def update
    @item = Item.find_by(parameterized_name: params[:item_name])
    @item.update_attributes(item_params)
    flash[:notice] = "Item has been successfully updated!"
    redirect_to menu_item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
end
