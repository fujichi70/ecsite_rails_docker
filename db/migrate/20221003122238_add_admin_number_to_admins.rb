class AddAdminNumberToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :admin_number, :string, null: false, default: ""

    # add_index :admins, :admin_number, unique: true
  end
end
