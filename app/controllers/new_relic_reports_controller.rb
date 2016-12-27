class NewRelicReportsController < ApplicationController
  before_action :set_new_relic_report, only: [:show, :edit, :update, :destroy]

  # GET /new_relic_reports
  # GET /new_relic_reports.json
  def index
    @new_relic_reports = NewRelicReport.all
  end

  # GET /new_relic_reports/1
  # GET /new_relic_reports/1.json
  def show
  end

  # GET /new_relic_reports/new
  def new
    @new_relic_report = NewRelicReport.new
  end

  # GET /new_relic_reports/1/edit
  def edit
  end

  # POST /new_relic_reports
  # POST /new_relic_reports.json
  def create
    @new_relic_report = NewRelicReport.new(new_relic_report_params)

    respond_to do |format|
      if @new_relic_report.save
        format.html { redirect_to @new_relic_report, notice: 'New relic report was successfully created.' }
        format.json { render :show, status: :created, location: @new_relic_report }
      else
        format.html { render :new }
        format.json { render json: @new_relic_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_relic_reports/1
  # PATCH/PUT /new_relic_reports/1.json
  def update
    respond_to do |format|
      if @new_relic_report.update(new_relic_report_params)
        format.html { redirect_to @new_relic_report, notice: 'New relic report was successfully updated.' }
        format.json { render :show, status: :ok, location: @new_relic_report }
      else
        format.html { render :edit }
        format.json { render json: @new_relic_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_relic_reports/1
  # DELETE /new_relic_reports/1.json
  def destroy
    @new_relic_report.destroy
    respond_to do |format|
      format.html { redirect_to new_relic_reports_url, notice: 'New relic report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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
