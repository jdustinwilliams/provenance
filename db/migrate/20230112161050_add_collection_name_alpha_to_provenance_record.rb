class AddCollectionNameAlphaToProvenanceRecord < ActiveRecord::Migration[7.0]
  def change
    add_column :provenance_records, :collection_name_alpha, :string
  end
end
