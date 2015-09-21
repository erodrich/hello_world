class AddDriverToUsers < ActiveRecord::Migration
  def change
    add_column :users, :driver, :boolean, default: false
  end
end
