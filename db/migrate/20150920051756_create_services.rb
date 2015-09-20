class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :addr_from
      t.string :addr_to
      t.date :date
      t.time :time
      t.integer :num_passengers
      t.string :type_vehicle
      t.string :payment_method
      t.string :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :services, [:user_id, :created_at]
  end
end
