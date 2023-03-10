module ProvenanceRecordsHelper
    def sort_link(column:, label:, class: nil)
        if column == params[:column]
            link_to(label, provenance_records_path(column: column, direction: next_direction), class: "link-light")
        else
            link_to(label, provenance_records_path(column: column, direction: 'asc'), class: "link-light")
        end
    end

    def toggle_unlisted_link(show_unlisted:, label:)
        if (show_unlisted == "true")
            show_unlisted = "false"
        else
            show_unlisted = "true"
        end
        link_to(label, provenance_records_path(show_unlisted: show_unlisted))
    end

    def next_direction
        params[:direction] == 'asc' ? 'desc' : 'asc'
    end
end
