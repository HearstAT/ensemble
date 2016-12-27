class ChefConfigsController < ApplicationController
  before_action :set_chef_config, only: [:show, :edit, :update, :destroy]

  # GET /chef_configs
  # GET /chef_configs.json
  def index
    @chef_configs = ChefConfig.all
  end

  # GET /chef_configs/1
  # GET /chef_configs/1.json
  def show
  end

  # GET /chef_configs/new
  def new
    @chef_config = ChefConfig.new
  end

  # GET /chef_configs/1/edit
  def edit
  end

  # POST /chef_configs
  # POST /chef_configs.json
  def create
    @chef_config = ChefConfig.new(chef_config_params)

    respond_to do |format|
      if @chef_config.save
        format.html { redirect_to @chef_config, notice: 'Chef config was successfully created.' }
        format.json { render :show, status: :created, location: @chef_config }
      else
        format.html { render :new }
        format.json { render json: @chef_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chef_configs/1
  # PATCH/PUT /chef_configs/1.json
  def update
    respond_to do |format|
      if @chef_config.update(chef_config_params)
        format.html { redirect_to @chef_config, notice: 'Chef config was successfully updated.' }
        format.json { render :show, status: :ok, location: @chef_config }
      else
        format.html { render :edit }
        format.json { render json: @chef_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chef_configs/1
  # DELETE /chef_configs/1.json
  def destroy
    @chef_config.destroy
    respond_to do |format|
      format.html { redirect_to chef_configs_url, notice: 'Chef config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chef_config
      @chef_config = ChefConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chef_config_params
      params.require(:chef_config).permit(:business_unit_id, :chef_server_url, :chef_organization, :admins)
    end
end
