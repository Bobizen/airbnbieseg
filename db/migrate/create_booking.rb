class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :flat_id
      t.decimal :price_per_night, precision: 10, scale: 2
      t.decimal :price_in_total, precision: 10, scale: 2
      t.date :checkin_date
      t.date :checkout_date
      t.integer :guests

      t.timestamps
    end
  end
end
