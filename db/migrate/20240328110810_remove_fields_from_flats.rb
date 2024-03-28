class RemoveFieldsFromFlats < ActiveRecord::Migration[7.0]
  def change
    remove_column :flats, :location, :string
    remove_column :flats, :pic, :string
  end
end
