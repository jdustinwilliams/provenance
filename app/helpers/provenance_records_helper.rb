module ProvenanceRecordsHelper
    def sort_link(column:, label:)
        link_to(label, provenance_records_path(column: column))
    end
end
