class PagerDutyConfigsController < ApplicationController
  before_action :set_pager_duty_config, only: [:show, :edit, :update, :destroy]

  # GET /pager_duty_configs
  # GET /pager_duty_configs.json
  def index
    @pager_duty_configs = PagerDutyConfig.all
  end

  # GET /pager_duty_configs/1
  # GET /pager_duty_configs/1.json
  def show
  end

  # GET /pager_duty_configs/new
  def new
    @pager_duty_config = PagerDutyConfig.new
  end

  # GET /pager_duty_configs/1/edit
  def edit
  end

  # POST /pager_duty_configs
  # POST /pager_duty_configs.json
  def create
    @pager_duty_config = PagerDutyConfig.new(pager_duty_config_params)

    respond_to do |format|
      if @pager_duty_config.save
        format.html { redirect_to @pager_duty_config, notice: 'Pager duty config was successfully created.' }
        format.json { render :show, status: :created, location: @pager_duty_config }
      else
        format.html { render :new }
        format.json { render json: @pager_duty_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pager_duty_configs/1
  # PATCH/PUT /pager_duty_configs/1.json
  def update
    respond_to do |format|
      if @pager_duty_config.update(pager_duty_config_params)
        format.html { redirect_to @pager_duty_config, notice: 'Pager duty config was successfully updated.' }
        format.json { render :show, status: :ok, location: @pager_duty_config }
      else
        format.html { render :edit }
        format.json { render json: @pager_duty_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pager_duty_configs/1
  # DELETE /pager_duty_configs/1.json
  def destroy
    @pager_duty_config.destroy
    respond_to do |format|
      format.html { redirect_to pager_duty_configs_url, notice: 'Pager duty config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pager_duty_config
      @pager_duty_config = PagerDutyConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pager_duty_config_params
      params.require(:pager_duty_config).permit(:business_unit_id, :sub_domain, :api_key, :service_api_key)
    end
end
