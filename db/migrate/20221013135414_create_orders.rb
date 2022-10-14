class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false, default: ""
      t.string :order_id, null: false, default: ""
      t.integer :quantity, null: false, default: ""
      t.date :delivery_requestday
      t.integer :delivery_fee, null: false, default: ""
      t.integer :total_fee, null: false, default: ""
 
      t.timestamps
    end
  end
end
