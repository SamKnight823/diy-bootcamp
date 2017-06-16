class CreateDrills < ActiveRecord::Migration[5.1]
  def change
  create_table :drills do |t|
    t.integer :cardio
    t.integer :pushups
    t.integer :squats
    t.integer :crunches
    t.integer :squatjacks
   end
  end
end
