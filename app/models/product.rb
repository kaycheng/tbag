class Product < ApplicationRecord
  include CodeGenerator
  acts_as_paranoid
  has_rich_text :content
  has_one_attached :cover_image

  validates :name, presence: true
  validates :list_price, :sell_price, numericality: { greater_than: 0, allow_nil: true}
  validates :code, uniqueness: true
  
  # relationships
  belongs_to :vendor
  belongs_to :category, optional: true
  has_many :skus
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true
  
end
