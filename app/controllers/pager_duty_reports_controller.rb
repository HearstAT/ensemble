class PagerDutyReportsController < ApplicationController
  before_action :set_pager_duty_report, only: [:show, :edit, :update, :destroy]

  # GET /pager_duty_reports
  # GET /pager_duty_reports.json
  def index
    @pager_duty_reports = PagerDutyReport.all
  end

  # GET /pager_duty_reports/1
  # GET /pager_duty_reports/1.json
  def show
  end

  # GET /pager_duty_reports/new
  def new
    @pager_duty_report = PagerDutyReport.new
  end

  # GET /pager_duty_reports/1/edit
  def edit
  end

  # POST /pager_duty_reports
  # POST /pager_duty_reports.json
  def create
    @pager_duty_report = PagerDutyReport.new(pager_duty_report_params)

    respond_to do |format|
      if @pager_duty_report.save
        format.html { redirect_to @pager_duty_report, notice: 'Pager duty report was successfully created.' }
        format.json { render :show, status: :created, location: @pager_duty_report }
      else
        format.html { render :new }
        format.json { render json: @pager_duty_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pager_duty_reports/1
  # PATCH/PUT /pager_duty_reports/1.json
  def update
    respond_to do |format|
      if @pager_duty_report.update(pager_duty_report_params)
        format.html { redirect_to @pager_duty_report, notice: 'Pager duty report was successfully updated.' }
        format.json { render :show, status: :ok, location: @pager_duty_report }
      else
        format.html { render :edit }
        format.json { render json: @pager_duty_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pager_duty_reports/1
  # DELETE /pager_duty_reports/1.json
  def destroy
    @pager_duty_report.destroy
    respond_to do |format|
      format.html { redirect_to pager_duty_reports_url, notice: 'Pager duty report was successfully destroyed.' }
      format.json { head :no_content }
    end
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
