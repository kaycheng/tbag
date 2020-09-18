class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :title
      t.text :description
      t.boolean :online

      t.timestamps
    end
  end
end
