require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "Basic functions" do
    it "We can add items to cart, then it won't be empty" do
      cart = Cart.new
      cart.add_item(2)
      expect(cart.empty?).to be false
    end
  end
end
