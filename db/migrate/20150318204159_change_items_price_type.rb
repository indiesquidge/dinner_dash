class ChangeItemsPriceType < ActiveRecord::Migration
  def change
    change_column :items, :price, :float
  end
end
