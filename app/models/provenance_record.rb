class ProvenanceRecord < ApplicationRecord
    has_many_attached :provenance_files
end
