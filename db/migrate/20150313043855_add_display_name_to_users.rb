class AddDisplayNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :display_name, :text
  end
end
