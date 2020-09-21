class RenamePriceToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :price, :list_price
    add_column :products, :sell_price, :decimal
    add_column :products, :on_sell, :boolean, default: false
    add_column :products, :code, :string
    add_column :products, :deleted_at, :datetime
    add_index :products, :deleted_at
  end
end
