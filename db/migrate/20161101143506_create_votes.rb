class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :count, null:false, default: 0
      t.integer :user_id, null: false
      t.integer :review_id, null:false
      t.timestamps
    end
  end
end
