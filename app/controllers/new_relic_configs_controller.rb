class NewRelicConfigsController < ApplicationController
  before_action :set_new_relic_config, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /new_relic_configs
  # GET /new_relic_configs.json
  def index
    @new_relic_configs = NewRelicConfig.all
  end

  # GET /new_relic_configs/1
  # GET /new_relic_configs/1.json
  def show; end

  # GET /new_relic_configs/new
  def new
    @new_relic_config = NewRelicConfig.new
  end

  # GET /new_relic_configs/1/edit
  def edit; end

  # POST /new_relic_configs
  # POST /new_relic_configs.json
  def create
    @new_relic_config = NewRelicConfig.new(new_relic_config_params)

    respond_to do |format|
      if @new_relic_config.save
        format.html { redirect_to @new_relic_config, notice: 'New relic config was successfully created.' }
        format.json { render :show, status: :created, location: @new_relic_config }
      else
        format.html { render :new }
        format.json { render json: @new_relic_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_relic_configs/1
  # PATCH/PUT /new_relic_configs/1.json
  def update
    respond_to do |format|
      if @new_relic_config.update(new_relic_config_params)
        format.html { redirect_to @new_relic_config, notice: 'New relic config was successfully updated.' }
        format.json { render :show, status: :ok, location: @new_relic_config }
      else
        format.html { render :edit }
        format.json { render json: @new_relic_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_relic_configs/1
  # DELETE /new_relic_configs/1.json
  def destroy
    @new_relic_config.destroy
    respond_to do |format|
      format.html { redirect_to new_relic_configs_url, notice: 'New relic config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_new_relic_config
    @new_relic_config = NewRelicConfig.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def new_relic_config_params
    params.require(:new_relic_config).permit(:business_unit_id, :account_number, :api_key)
  end
end
