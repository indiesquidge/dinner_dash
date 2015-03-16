class ItemsController < ApplicationController
  def show
    @item = Item.find_by(parameterized_name: params[:item_name])
  end

  def new
    @item = Item.new
    authorize! :new, @item
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:success] = "New item has been created!"
      redirect_to menu_item_path(@item)
    else
      flash[:error] = "Attributes missing"
      redirect_to new_menu_item_path
    end
  end

  def edit
    @item = Item.find_by(parameterized_name: params[:item_name])
    authorize! :edit, @item
  end

  def update
    @item = Item.find_by(parameterized_name: params[:item_name])
    if @item.update_attributes(item_params)
      flash[:success] = "Item has been successfully updated!"
      redirect_to menu_item_path(@item)
    else
      flash[:error] = "Attributes missing."
      redirect_to :back
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, category_ids: [])
  end
end
