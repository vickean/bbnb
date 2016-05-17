class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id
      t.date :booking_start
      t.date :booking_end
      t.integer :pax
      t.integer :total_price

      t.timestamps null: false
    end
  end
end
