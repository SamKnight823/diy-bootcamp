class AddUserIdToDrills < ActiveRecord::Migration[5.1]
  def change
    add_column :drills, :user_id, :integer
  end
end
