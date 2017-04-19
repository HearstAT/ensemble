# frozen_string_literal: true
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
  def show; end

  # GET /chef_server_reports/new
  def new; end

  # GET /chef_server_reports/1/edit
  def edit; end

  # POST /chef_server_reports
  # POST /chef_server_reports.json
  def create; end

  # PATCH/PUT /chef_server_reports/1
  # PATCH/PUT /chef_server_reports/1.json
  def update; end

  # DELETE /chef_server_reports/1
  # DELETE /chef_server_reports/1.json
  def destroy; end

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
