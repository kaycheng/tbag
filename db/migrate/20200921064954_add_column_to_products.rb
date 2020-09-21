class AddColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_index :products, :code, unique: true
    add_reference :products, :vendor, index: true
  end
end
