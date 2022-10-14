class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :user_id, null: false, default: ""
      t.string :order_id, null: false, default: ""
      t.string :delivery_request
      t.string :delivery_fee, null: false, default: ""
      t.string :total_fee, null: false, default: ""
 
      t.timestamps
    end
  end
end
