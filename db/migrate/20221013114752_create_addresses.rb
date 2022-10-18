class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :zip, null: false, default: ""
      t.string :address, null: false, default:""
      t.string :phone, null: false, default:""
      
      t.references :user, null: false, foreigen_key: true 
      t.timestamps
    end
  end
end
