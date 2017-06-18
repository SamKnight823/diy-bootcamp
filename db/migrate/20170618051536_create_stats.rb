class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.string :gender
      t.integer :age
      t.integer :weight
      t.integer :height
      t.integer :user_id
     end
    end
end
