class CreateProvenanceRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :provenance_records do |t|
      t.string :accession_number
      t.string :collection_name
      t.integer :start_year
      t.integer :end_year
      t.string :date_expression
      t.integer :year_received
      t.integer :month_received
      t.integer :day_received
      t.decimal :linear_feet, precision: 7, scale: 2
      t.string :containers

      t.timestamps
    end
  end
end
