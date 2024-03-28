class AddFieldsToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :homepagetitle, :string
    add_column :flats, :location, :string
    add_column :flats, :pic, :string
  end
end
