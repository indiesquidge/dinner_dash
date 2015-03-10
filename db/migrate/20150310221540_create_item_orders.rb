class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
      t.integer :quantity
      t.references :item, index: true
      t.references :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :item_orders, :items
    add_foreign_key :item_orders, :orders
  end
end
