class CreateFlatavailabledates < ActiveRecord::Migration[7.0]
  def change
    create_table :flatavailabledates do |t|
      t.references :flat, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
