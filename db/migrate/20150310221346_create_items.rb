class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :name
      t.text :description
      t.integer :price
      t.text :photo
      t.boolean :retired

      t.timestamps null: false
    end
  end
end
