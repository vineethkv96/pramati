class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :name
      t.integer :phone_number
      t.text :address
      t.string :email

      t.timestamps
    end
  end
end
