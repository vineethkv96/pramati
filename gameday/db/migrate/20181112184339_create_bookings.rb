class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :stadium_id
      t.integer :game_id
      t.date :booking_date
      t.string :time_slot
      t.string :is_paid

      t.timestamps
    end
    
    add_index :bookings, [:user_id, :stadium_id]
  end
end
