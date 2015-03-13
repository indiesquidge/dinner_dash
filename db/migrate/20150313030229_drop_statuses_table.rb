class DropStatusesTable < ActiveRecord::Migration
  def up
    drop_table :statuses
  end

  def down
    create_table :statuses do |t|
      t.text :current_type

      t.timestamps null: false
    end
  end
end
