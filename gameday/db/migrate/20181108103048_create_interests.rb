class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.integer :game_id
      t.integer :user_id
      t.date :date_join

      t.timestamps
    end
  end
end
