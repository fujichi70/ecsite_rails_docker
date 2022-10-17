class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :user, foreigen_key: true 
      t.string :zip, null: false, default: ""
      t.string :address, null: false, default:""
      t.string :phone, null: false, default:""

      t.timestamps
    end
  end
end
