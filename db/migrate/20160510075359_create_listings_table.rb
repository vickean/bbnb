class CreateListingsTable < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :status
      t.string :home_type
      t.string :room_type
      t.integer :min_stay
      t.integer :price
      t.integer :pax
      t.string :city
      t.string :address
      t.text :tags, array: true
      t.timestamps
    end
  end
end
