class RemoveImageWithTypeTextFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :image, :text
  end
end
