class AddDefaultQuantitytoItemOrder < ActiveRecord::Migration
  def change
    change_column_default :item_orders, :quantity, 1
  end
end
