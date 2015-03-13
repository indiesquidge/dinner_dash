class GiveStatusDefaultTypeOnItems < ActiveRecord::Migration
  def change
    change_column :items, :status, :text, default: "active"
  end
end
