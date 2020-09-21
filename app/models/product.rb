class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :code_generator, use: :slugged, slug_column: :code

  belongs_to :vendor

  private
  def code_generator
    SecureRandom.hex(10)
  end
end
