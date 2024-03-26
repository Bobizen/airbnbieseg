class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.references :user, null: false, foreign_key: true
      t.string :country
      t.string :city
      t.string :region
      t.string :zipcode
      t.text :description
      t.float :price_per_night, precision: 10, scale: 2
      t.boolean :free_cancellation

      t.timestamps
    end
  end
end
