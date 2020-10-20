class Sku < ApplicationRecord
  belongs_to :product, dependent: :destroy
end
