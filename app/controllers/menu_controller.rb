class MenuController < ApplicationController
  def index
    @items = Item.all.reverse
  end
end
