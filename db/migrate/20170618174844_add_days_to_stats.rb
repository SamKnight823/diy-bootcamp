class AddDaysToStats < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :day, :integer
    add_column :stats, :calories, :integer
  end
end
