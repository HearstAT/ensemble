class PagerDutyIncidentsController < ApplicationController
  before_action :set_pager_duty_incident, only: [:show, :edit, :update, :destroy]

  def incident_mttr_per_month
    PagerDutyIncident.group(:business_unit).map.each do |bu|
      result[bu] = bu.group_by_month(:created_on).average(:seconds_to_resolve)
    end
    render json: [{name: 'MTTR', data: result}]
  end



  # GET /pager_duty_incidents
  # GET /pager_duty_incidents.json
  def index
    #@pager_duty_incidents = PagerDutyIncident.order(created_on: :desc)
    @pager_duty_incidents = PagerDutyIncident.paginate(:page => params[:page], :per_page => 30).order('id DESC')
  end

  # GET /pager_duty_incidents/1
  # GET /pager_duty_incidents/1.json
  def show
  end

  # GET /pager_duty_incidents/new
  def new
    @pager_duty_incident = PagerDutyIncident.new
  end

  # GET /pager_duty_incidents/1/edit
  def edit
  end

  # POST /pager_duty_incidents
  # POST /pager_duty_incidents.json
  def create
    @pager_duty_incident = PagerDutyIncident.new(pager_duty_incident_params)

    respond_to do |format|
      if @pager_duty_incident.save
        format.html { redirect_to @pager_duty_incident, notice: 'Pager duty incident was successfully created.' }
        format.json { render :show, status: :created, location: @pager_duty_incident }
      else
        format.html { render :new }
        format.json { render json: @pager_duty_incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pager_duty_incidents/1
  # PATCH/PUT /pager_duty_incidents/1.json
  def update
    respond_to do |format|
      if @pager_duty_incident.update(pager_duty_incident_params)
        format.html { redirect_to @pager_duty_incident, notice: 'Pager duty incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @pager_duty_incident }
      else
        format.html { render :edit }
        format.json { render json: @pager_duty_incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pager_duty_incidents/1
  # DELETE /pager_duty_incidents/1.json
  def destroy
    @pager_duty_incident.destroy
    respond_to do |format|
      format.html { redirect_to pager_duty_incidents_url, notice: 'Pager duty incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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
