class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.references :user, null: false, foreign_key: true
      t.string :country
      t.string :city
      t.string :region
      t.string :zipcode
      t.text :description
      t.decimal :price_per_night
      t.boolean :free_cancellation

      t.timestamps
    end
  end
end
