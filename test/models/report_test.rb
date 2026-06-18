# test/models/report_test.rb
require "test_helper"

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = create(:report)
  end

  test "should be valid" do
    assert @report.valid?
  end

  test "should require company_domain" do
    @report.company_domain = nil
    assert_not @report.valid?
    assert_includes @report.errors[:company_domain], "can't be blank"
  end

  test "should enforce unique company_domain" do
    duplicate = build(:report, company_domain: @report.company_domain)
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:company_domain], "has already been taken"
  end
end
