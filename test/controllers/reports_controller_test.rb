# test/controllers/reports_controller_test.rb
require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = create(:report)
    @reports = create_list(:report, 12) # creates 12 more reports (total 13)
  end

  test "should get index with last 10 reports" do
    get reports_url
    assert_response :success

    json = response.parsed_body
    assert_equal 10, json.length

    # Verify they're the most recent (by id descending)
    expected_ids = Report.order(id: :desc).limit(10).pluck(:id)
    returned_ids = json.map { |r| r["id"] }
    assert_equal expected_ids, returned_ids
  end

  test "should search reports by domain name" do
    get reports_url, params: { search: @report.company_domain }
    assert_response :success

    json = response.parsed_body
    assert json.any? { |r| r["company_domain"] == @report.company_domain }
  end

  test "should return empty array when search finds nothing" do
    get reports_url, params: { search: "nonexistent-domain-12345.com" }
    assert_response :success

    json = response.parsed_body
    assert_empty json
  end

  test "should show report by id" do
    get report_url(@report)
    assert_response :success

    json = response.parsed_body
    assert_equal @report.id, json["id"]
    assert_equal @report.company_name, json["company_name"]
    assert_equal @report.company_domain, json["company_domain"]
  end

  test "should return 404 for non-existent report" do
    get report_url(id: 999999)
    assert_response :not_found
  end
end
