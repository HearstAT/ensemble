class PagerDutyReportsController < ApplicationController
  before_action :set_pager_duty_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pager_duty_reports
  # GET /pager_duty_reports.json
  def index
    @pager_duty_reports = PagerDutyReport.all
    @pager_duty_incidents = PagerDutyIncident.order(created_on: :desc).limit(10)
  end

  # GET /pager_duty_reports/1
  # GET /pager_duty_reports/1.json
  def show
  end

  # GET /pager_duty_reports/new
  def new
  end

  # GET /pager_duty_reports/1/edit
  def edit
  end

  # POST /pager_duty_reports
  # POST /pager_duty_reports.json
  def create
  end

  # PATCH/PUT /pager_duty_reports/1
  # PATCH/PUT /pager_duty_reports/1.json
  def update
  end

  # DELETE /pager_duty_reports/1
  # DELETE /pager_duty_reports/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pager_duty_report
      @pager_duty_report = PagerDutyReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pager_duty_report_params
      params.require(:pager_duty_report).permit(:business_unit_id, :number_of_incidents)
    end
end
