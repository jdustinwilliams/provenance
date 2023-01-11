require "application_system_test_case"

class ProvenanceRecordsTest < ApplicationSystemTestCase
  setup do
    @provenance_record = provenance_records(:one)
  end

  test "visiting the index" do
    visit provenance_records_url
    assert_selector "h1", text: "Provenance records"
  end

  test "should create provenance record" do
    visit provenance_records_url
    click_on "New provenance record"

    fill_in "Accession number", with: @provenance_record.accession_number
    fill_in "Collection name", with: @provenance_record.collection_name
    fill_in "Containers", with: @provenance_record.containers
    fill_in "Date expression", with: @provenance_record.date_expression
    fill_in "Day received", with: @provenance_record.day_received
    fill_in "End year", with: @provenance_record.end_year
    fill_in "Linear feet", with: @provenance_record.linear_feet
    fill_in "Month received", with: @provenance_record.month_received
    fill_in "Start year", with: @provenance_record.start_year
    fill_in "Year received", with: @provenance_record.year_received
    click_on "Create Provenance record"

    assert_text "Provenance record was successfully created"
    click_on "Back"
  end

  test "should update Provenance record" do
    visit provenance_record_url(@provenance_record)
    click_on "Edit this provenance record", match: :first

    fill_in "Accession number", with: @provenance_record.accession_number
    fill_in "Collection name", with: @provenance_record.collection_name
    fill_in "Containers", with: @provenance_record.containers
    fill_in "Date expression", with: @provenance_record.date_expression
    fill_in "Day received", with: @provenance_record.day_received
    fill_in "End year", with: @provenance_record.end_year
    fill_in "Linear feet", with: @provenance_record.linear_feet
    fill_in "Month received", with: @provenance_record.month_received
    fill_in "Start year", with: @provenance_record.start_year
    fill_in "Year received", with: @provenance_record.year_received
    click_on "Update Provenance record"

    assert_text "Provenance record was successfully updated"
    click_on "Back"
  end

  test "should destroy Provenance record" do
    visit provenance_record_url(@provenance_record)
    click_on "Destroy this provenance record", match: :first

    assert_text "Provenance record was successfully destroyed"
  end
end
