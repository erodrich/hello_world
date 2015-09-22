class AddDriverToServices < ActiveRecord::Migration
  def change
  	add_column :services, :driver_id, :integer, :references => "users"
  end
end
