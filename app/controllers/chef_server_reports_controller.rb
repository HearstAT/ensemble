class ChefServerReportsController < ApplicationController
  before_action :set_chef_server_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /chef_server_reports
  # GET /chef_server_reports.json
  def index
    @chef_server_reports = ChefServerReport.all
  end

  # GET /chef_server_reports/1
  # GET /chef_server_reports/1.json
  def show
  end

  # GET /chef_server_reports/new
  def new
    @chef_server_report = ChefServerReport.new
  end

  # GET /chef_server_reports/1/edit
  def edit
  end

  # POST /chef_server_reports
  # POST /chef_server_reports.json
  def create
    @chef_server_report = ChefServerReport.new(chef_server_report_params)

    respond_to do |format|
      if @chef_server_report.save
        format.html { redirect_to @chef_server_report, notice: 'Chef server report was successfully created.' }
        format.json { render :show, status: :created, location: @chef_server_report }
      else
        format.html { render :new }
        format.json { render json: @chef_server_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chef_server_reports/1
  # PATCH/PUT /chef_server_reports/1.json
  def update
    respond_to do |format|
      if @chef_server_report.update(chef_server_report_params)
        format.html { redirect_to @chef_server_report, notice: 'Chef server report was successfully updated.' }
        format.json { render :show, status: :ok, location: @chef_server_report }
      else
        format.html { render :edit }
        format.json { render json: @chef_server_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chef_server_reports/1
  # DELETE /chef_server_reports/1.json
  def destroy
    @chef_server_report.destroy
    respond_to do |format|
      format.html { redirect_to chef_server_reports_url, notice: 'Chef server report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chef_server_report
      @chef_server_report = ChefServerReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chef_server_report_params
      params.require(:chef_server_report).permit(:business_unit_id, :number_of_nodes, :number_of_users, :number_of_cookbooks)
    end
end
