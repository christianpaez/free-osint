# test/jobs/generate_report_job_test.rb
require "test_helper"

class GenerateReportJobTest < ActiveJob::TestCase
  test "creates a report with faker data" do
    domain = "example.com"
    assert_difference "Report.count", 1 do
      GenerateReportJob.perform_now(domain)
    end

    report = Report.last
    assert_equal domain, report.company_domain
    assert_not_nil report.company_name
    assert_not_nil report.osint_findings
  end

  test "handles domain with hyphens" do
    domain = "my-test-domain.com"

    GenerateReportJob.perform_now(domain)

    report = Report.last
    assert_equal domain, report.company_domain
    assert_equal "my_test_domain_com", report.osint_findings["id"]
  end

  test "does not create duplicate reports for same domain" do
    domain = "duplicate.com"

    GenerateReportJob.perform_now(domain)

    assert_raises(ActiveRecord::RecordInvalid) do
      GenerateReportJob.perform_now(domain)
    end

    assert_equal 1, Report.where(company_domain: domain).count
  end
end
