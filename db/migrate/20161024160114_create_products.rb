class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.text :description, null:false
      t.string :image_url, null: false, default: "/assets/default_picture.jpg"
      t.integer :user_id, null: false
    end
  end
end
