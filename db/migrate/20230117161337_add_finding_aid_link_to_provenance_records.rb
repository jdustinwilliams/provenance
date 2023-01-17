class AddFindingAidLinkToProvenanceRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :provenance_records, :finding_aid_link, :string
  end
end
