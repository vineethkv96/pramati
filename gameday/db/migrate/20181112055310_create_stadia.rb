class CreateStadia < ActiveRecord::Migration[5.2]
  def change
    create_table :stadia do |t|
      t.string :name
      t.text :address
      t.string :contact_number
      t.string :game
      t.string :price_for_hour

      t.timestamps
    end
  end
end
