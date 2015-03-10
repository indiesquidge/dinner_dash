class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.references :item, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :item_categories, :items
    add_foreign_key :item_categories, :categories
  end
end
