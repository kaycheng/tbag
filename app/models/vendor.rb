class Vendor < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true
  has_many :products
end
