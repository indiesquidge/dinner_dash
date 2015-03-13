class RemoveStatusReferenceFromOrders < ActiveRecord::Migration
  def change
    remove_reference :orders, :status
  end
end
