# app/controllers/reports_controller.rb
class ReportsController < ApplicationController
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
end
