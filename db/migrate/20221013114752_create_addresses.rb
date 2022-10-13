class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false, default: "", unique: true 
      t.integer :zip, null: false, default: ""
      t.string :address, null: false, default:""

      t.timestamps
    end
  end
end
