class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.string :correo
      t.string :password

      t.timestamps null: false
    end
  end
end
