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

    it "We can add item to cart, and we can put out the same product." do
      cart = Cart.new
      # v1 = Vendor.create(title: "v1")
      # p1 = Product.create(name: "p1", vendor: v1)
      p1 = FactoryBot.create(:product)

      cart.add_item(p1.id)
      expect(cart.items.first.product).to be_a Product
    end

    it "Every cart can count price." do
      cart = Cart.new

      p1 = FactoryBot.create(:product, sell_price: 10)
      p2 = FactoryBot.create(:product, sell_price: 5)

      3.times { cart.add_item(p1.id) }
      2.times { cart.add_item(p2.id) }

      expect(cart.total_price).to eq 40
    end
  end
end
