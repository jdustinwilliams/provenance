module ProvenanceRecordsHelper
    def sort_link(column:, label:, show_unlisted: nil, class: nil)
        if column == params[:column]
            link_to(label, provenance_records_path(column: column, direction: next_direction, show_unlisted: show_unlisted), class: "link-light")
        else
            link_to(label, provenance_records_path(column: column, direction: 'asc', show_unlisted: show_unlisted), class: "link-light")
        end
    end

    def toggle_unlisted_link(show_unlisted:, column: nil, direction: nil, label:)
        if (show_unlisted == "true")
            show_unlisted = "false"
        else
            show_unlisted = "true"
        end
        link_to(label, provenance_records_path(show_unlisted: show_unlisted, column: column, direction: direction))
    end

    def next_direction
        params[:direction] == 'asc' ? 'desc' : 'asc'
    end
end
