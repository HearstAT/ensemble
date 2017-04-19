# frozen_string_literal: true
class NewRelicReportsController < ApplicationController
  before_action :set_new_relic_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /new_relic_reports
  # GET /new_relic_reports.json
  def index
    @new_relic_reports = NewRelicReport.all
    @new_relic_configs = NewRelicConfig.all
    @new_relic_applications = NewRelicApplication.all
    @business_units = BusinessUnit.all
  end

  # GET /new_relic_reports/1
  # GET /new_relic_reports/1.json
  def show; end

  # GET /new_relic_reports/new
  def new
    @new_relic_report = NewRelicReport.new
  end

  # GET /new_relic_reports/1/edit
  def edit; end

  # POST /new_relic_reports
  # POST /new_relic_reports.json
  def create; end

  # PATCH/PUT /new_relic_reports/1
  # PATCH/PUT /new_relic_reports/1.json
  def update; end

  # DELETE /new_relic_reports/1
  # DELETE /new_relic_reports/1.json
  def destroy; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_new_relic_report
    @new_relic_report = NewRelicReport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def new_relic_report_params
    params.require(:new_relic_report).permit(:business_unit_id, :number_of_servers, :number_of_apps)
  end
end
