class AddUnlistToProvenanceRecord < ActiveRecord::Migration[7.0]
  def change
    add_column :provenance_records, :unlist, :boolean, default: false
  end
end
