class AddDefaultRoleToRetiredItem < ActiveRecord::Migration
  def change
    change_column :items, :retired, :boolean, default: false
  end
end
