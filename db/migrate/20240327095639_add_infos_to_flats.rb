class AddInfosToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :address, :string
    add_column :flats, :title, :string
    add_column :flats, :street_address, :string
  end
end
