module ProvenanceRecordsHelper
    def sort_link(column:, label:)
        link_to(label, provenance_records_path(column: column))
    end

    def toggle_unlisted_link(show_unlisted:, label:)
        if (show_unlisted == "true")
            show_unlisted = "false"
        else
            show_unlisted = "true"
        end
        link_to(label, provenance_records_path(show_unlisted: show_unlisted))
    end
end
