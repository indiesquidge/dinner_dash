class AddSlugColumnToItemAndCategory < ActiveRecord::Migration
  def change
    add_column :items, :parameterized_name, :text
    add_column :categories, :parameterized_name, :text
  end
end
