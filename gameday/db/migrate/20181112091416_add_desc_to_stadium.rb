class AddDescToStadium < ActiveRecord::Migration[5.2]

  def change
    add_column :stadia, :description, :text
  end

end
