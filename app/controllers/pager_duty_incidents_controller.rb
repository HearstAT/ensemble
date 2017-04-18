class PagerDutyIncidentsController < ApplicationController
  before_action :set_pager_duty_incident, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pager_duty_incidents
  # GET /pager_duty_incidents.json
  def index
    # @pager_duty_incidents = PagerDutyIncident.order(created_on: :desc)
    @pager_duty_incidents = PagerDutyIncident.paginate(page: params[:page], per_page: 30).order('created_on DESC')
  end

  # GET /pager_duty_incidents/1
  # GET /pager_duty_incidents/1.json
  def show; end

  # GET /pager_duty_incidents/new
  def new; end

  # GET /pager_duty_incidents/1/edit
  def edit; end

  # POST /pager_duty_incidents
  # POST /pager_duty_incidents.json
  def create; end

  # PATCH/PUT /pager_duty_incidents/1
  # PATCH/PUT /pager_duty_incidents/1.json
  def update; end

  # DELETE /pager_duty_incidents/1
  # DELETE /pager_duty_incidents/1.json
  def destroy; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pager_duty_incident
    @pager_duty_incident = PagerDutyIncident.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pager_duty_incident_params
    params.require(:pager_duty_incident).permit(:business_unit_id, :id, :incident_number, :description, :service_id, :service_name, :escalation_policy_id, :created_on, :resolved_on, :seconds_to_first_ack, :seconds_to_resolve, :auto_resolved, :acknowledge_count, :assignment_count, :acknowledged_by_user_ids, :acknowledged_by_user_names, :resolved_by_user_id, :resolved_by_user_name, :urgency)
  end
end
