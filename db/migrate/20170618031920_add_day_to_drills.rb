class AddDayToDrills < ActiveRecord::Migration[5.1]
  def change
    add_column :drills, :day, :integer
  end
end
