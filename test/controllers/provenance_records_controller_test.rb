require "test_helper"

class ProvenanceRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provenance_record = provenance_records(:one)
  end

  test "should get index" do
    get provenance_records_url
    assert_response :success
  end

  test "should get new" do
    get new_provenance_record_url
    assert_response :success
  end

  test "should create provenance_record" do
    assert_difference("ProvenanceRecord.count") do
      post provenance_records_url, params: { provenance_record: { accession_number: @provenance_record.accession_number, collection_name: @provenance_record.collection_name, containers: @provenance_record.containers, date_expression: @provenance_record.date_expression, day_received: @provenance_record.day_received, end_year: @provenance_record.end_year, linear_feet: @provenance_record.linear_feet, month_received: @provenance_record.month_received, start_year: @provenance_record.start_year, year_received: @provenance_record.year_received } }
    end

    assert_redirected_to provenance_record_url(ProvenanceRecord.last)
  end

  test "should show provenance_record" do
    get provenance_record_url(@provenance_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_provenance_record_url(@provenance_record)
    assert_response :success
  end

  test "should update provenance_record" do
    patch provenance_record_url(@provenance_record), params: { provenance_record: { accession_number: @provenance_record.accession_number, collection_name: @provenance_record.collection_name, containers: @provenance_record.containers, date_expression: @provenance_record.date_expression, day_received: @provenance_record.day_received, end_year: @provenance_record.end_year, linear_feet: @provenance_record.linear_feet, month_received: @provenance_record.month_received, start_year: @provenance_record.start_year, year_received: @provenance_record.year_received } }
    assert_redirected_to provenance_record_url(@provenance_record)
  end

  test "should destroy provenance_record" do
    assert_difference("ProvenanceRecord.count", -1) do
      delete provenance_record_url(@provenance_record)
    end

    assert_redirected_to provenance_records_url
  end
end
