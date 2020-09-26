require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "Basic functions" do
    it "We can add items to cart, then it won't be empty" do
      cart = Cart.new
      cart.add_item(2)
      expect(cart.empty?).to be false
    end

    it "If we add same item to cart, the product quantity will be changed instead of cart item." do
      cart = Cart.new
      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }
      
      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
    end
  end
end
