class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true

      t.float :price_per_night, precision: 10, scale: 2
      t.float :price_in_total, precision: 10, scale: 2
      t.date :checkin_date
      t.date :checkout_date
      t.integer :guests
      t.timestamps
    end
  end
end
