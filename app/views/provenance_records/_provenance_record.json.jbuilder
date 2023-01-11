json.extract! provenance_record, :id, :accession_number, :collection_name, :start_year, :end_year, :date_expression, :year_received, :month_received, :day_received, :linear_feet, :containers, :created_at, :updated_at
json.url provenance_record_url(provenance_record, format: :json)
