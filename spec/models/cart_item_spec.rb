require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe "Basic function" do
    it "Every cart item can count price." do
      cart = Cart.new
      
      p1 = FactoryBot.create(:product, sell_price: 10)
      p2 = FactoryBot.create(:product, sell_price: 5)

      3.times { cart.add_item(p1.id) }
      2.times { cart.add_item(p2.id) }

      expect(cart.items.first.total_price).to eq 30
      expect(cart.items.last.total_price).to eq 10
    end
  end
end
