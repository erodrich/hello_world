class AddIndexToUsersCorreo < ActiveRecord::Migration
  def change
    add_index :users, :correo, unique: true
  end
end
