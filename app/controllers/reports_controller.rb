# app/controllers/reports_controller.rb
class ReportsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create ]

  def index
    reports = Report.order(id: :desc)
    reports = reports.where("company_domain ILIKE ?", "%#{params[:search]}%") if params[:search].present?
    reports = reports.limit(10)

    render json: reports
  end

  def show
    report = Report.find(params[:id])
    render json: report
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Report not found" }, status: :not_found
  end

  def create
    domain = report_params[:domain]

    if domain.blank?
      render json: { error: "Domain is required" }, status: :bad_request
      return
    end

    existing_report = Report.find_by(company_domain: domain)
    if existing_report
      render json: {
        message: "Report already exists",
        report_id: existing_report.id,
        domain: domain,
        status: "completed"
      }, status: :ok
      return
    end

    GenerateReportJob.perform_later(domain)

    render json: {
      message: "Report generation started",
      domain: domain,
      status: "processing"
    }, status: :ok
  end

  private

  def report_params
    params.permit(:domain)
  end
end
