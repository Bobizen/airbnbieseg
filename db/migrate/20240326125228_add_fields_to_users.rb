class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :legal_name, :string
    add_column :users, :government_id, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :emergency_contact_number, :string
    add_column :users, :description, :text
  end
end
