class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title, null:false
      t.string :username, null:false
      t.text :content, null:false
      t.integer :product_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
