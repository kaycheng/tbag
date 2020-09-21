class AddReferenceOnProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :vendor, index: true
  end
end
