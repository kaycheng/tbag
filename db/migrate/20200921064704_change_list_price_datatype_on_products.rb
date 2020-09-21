class ChangeListPriceDatatypeOnProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :list_price, :decimal
  end
end
