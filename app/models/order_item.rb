class OrderItem < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :sku, dependent: :destroy

  def total_price
    quantity * sku.product.sell_price
  end
end
