class Product < ApplicationRecord
  include CodeGenerator
  acts_as_paranoid
  has_rich_text :content

  validates :name, presence: true
  validates :list_price, :sell_price, numericality: { greater_than: 0, allow_nil: true}
  validates :code, uniqueness: true
  
  belongs_to :vendor

end
