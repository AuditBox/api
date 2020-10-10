class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]
  before_action :set_organization
  # GET /assets
  # GET /assets.json
  def index
    @scopes = @organization.scopes.all
    @scope = Scope.find params[:scope] if params[:scope]

    @assets = @scope.assets if @scope
    @assets = @organization.assets.all unless @scope
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
  end

  # GET /assets/new
  def new
    @asset = Asset.new organization: @organization
  end

  # GET /assets/1/edit
  def edit
  end

  # POST /assets
  # POST /assets.json
  def create
    @asset = Asset.new(asset_params)
    @asset.organization = @organization
    
    respond_to do |format|
      if @asset.save
        format.html { redirect_to assets_path, notice: 'Asset was successfully created.' }
        format.json { render :show, status: :created, location: @asset }
      else
        format.html { render :new }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset }
      else
        format.html { render :edit }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url, notice: 'Asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asset_params
      params.fetch(:asset, {}).permit(:handle, :asset_type, :props, :tags)
    end

    def set_organization
       @organization = Organization.first
    end
end
