class ChangeRetiredOnItems < ActiveRecord::Migration
  def change
    remove_column :items, :retired
    add_column :items, :status, :text
  end
end
