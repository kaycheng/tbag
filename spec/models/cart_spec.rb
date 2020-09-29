require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.new } 
  
  describe "Basic functions" do

    it "We can add items to cart, then it won't be empty" do
      cart.add_sku(2)
      # expect(cart.empty?).to be false
      expect(cart).not_to be_empty
    end

    it "If we add same item to cart, the product quantity will be changed instead of cart item." do
      3.times { cart.add_sku(1) }
      2.times { cart.add_sku(2) }
      
      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
    end

    it "We can add item to cart, and we can put out the same product." do
      # v1 = Vendor.create(title: "v1")
      # p1 = Product.create(name: "p1", vendor: v1)
      p1 = FactoryBot.create(:product, :with_skus)

      cart.add_sku(p1.skus.first.id)
      expect(cart.items.first.product).to be_a Product
    end

    it "Every cart can count price." do

      p1 = FactoryBot.create(:product, :with_skus, sell_price: 10)
      p2 = FactoryBot.create(:product, :with_skus, sell_price: 5)

      3.times { cart.add_sku(p1.skus.first.id) }
      2.times { cart.add_sku(p2.skus.first.id) }

      expect(cart.total_price).to eq 40
    end
  end

  describe "Further functions" do
    it "The cart content can be hash and store in session" do

      3.times { cart.add_sku(1) }
      2.times { cart.add_sku(2) }

      expect(cart.serialize).to eq cart_hash
    end

    it "We can let content in session to transfer to cart item content." do
      cart = Cart.from_hash(cart_hash)

      expect(cart.items.first.quantity).to be 3
    end

    private
    def cart_hash
      {
        "items" => [
          {"sku_id" => 1, "quantity" => 3},
          {"sku_id" => 2, "quantity" => 2}
        ]
      }
    end
  end
end
