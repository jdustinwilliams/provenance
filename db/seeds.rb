# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Based on a helpful gist: https://gist.github.com/arjunvenkat/1115bc41bf395a162084
require 'csv'

file_path = Rails.root.join('lib', 'seeds', 'collections.csv')

if !File.exist?(file_path)
    # Give red-colored error message
    puts "\e[31mERROR: #{file_path} not found.\e[0m"
    exit
end

csv_text = File.read(file_path)
csv = CSV.parse(csv_text, headers: true, encoding: 'UTF-8')

csv.each do |row|
    p = ProvenanceRecord.new
    p.accession_number = row[0]
    puts "Accession #: #{row[0]}"
    p.collection_name = row['collection_name']
    p.collection_name_alpha = row['collection_name_alpha']
    p.start_year = row['start_year']
    p.end_year = row['end_year']
    p.date_expression = row['date_expression']
    p.linear_feet = row['linear_feet']
    p.containers = row['containers']

    if (row[2] && row[2].include?("X"))
        p.unlist = true
    else
        p.unlist = false
    end

    p.save
end