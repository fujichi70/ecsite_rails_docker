class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product, null: false, default: ""
      t.string :product_description
      t.string :product_price, null: false, default: ""
      t.string :product_quantity, null: false, default: ""

      t.timestamps
    end
  end
end
