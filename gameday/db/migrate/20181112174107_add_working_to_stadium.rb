class AddWorkingToStadium < ActiveRecord::Migration[5.2]
  def change
    add_column :stadia, :open_time, :string
    add_column :stadia, :close_time, :string
  end
end
