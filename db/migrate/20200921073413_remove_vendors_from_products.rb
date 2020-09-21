class RemoveVendorsFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :vendors_id
    remove_index :products, name: "index_products_on_vendor_id"
  end
end
