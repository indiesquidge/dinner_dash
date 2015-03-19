class MenuController < ApplicationController
  def index
    @active_items = Item.active_items
    @retired_items = Item.retired_items
  end
end
