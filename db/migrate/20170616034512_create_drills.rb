class CreateDrills < ActiveRecord::Migration[5.1]
  def change
    create_table :drills do |t|
      t.string :name
      t.integer :reps
    end
  end
end
