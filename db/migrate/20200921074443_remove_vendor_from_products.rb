class RemoveVendorFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :vendor_id
  end
end
