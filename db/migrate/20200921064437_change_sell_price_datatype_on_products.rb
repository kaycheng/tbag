class ChangeSellPriceDatatypeOnProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :sell_price, :decimal
  end
end
