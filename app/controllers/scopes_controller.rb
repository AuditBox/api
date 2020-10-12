class ScopesController < AuthorizationController
  before_action :set_scope, only: %i[show edit update destroy]
  before_action :set_organization # GET /scopes.json
  def index
    @scopes = @organization.scopes.all
  end

  # GET /scopes/1
  # GET /scopes/1.json
  def show; end

  # GET /scopes/new
  def new
    @scope = Scope.new organization: @organization
  end

  # GET /scopes/1/edit
  def edit; end

  # POST /scopes
  # POST /scopes.json
  def create
    @scope = Scope.new(scope_params)
    @scope.organization = @organization
    respond_to do |format|
      if @scope.save
        format.html do
          redirect_to @scope, notice: 'Scope was successfully created.'
        end
        format.json { render :show, status: :created, location: @scope }
      else
        format.html { render :new }
        format.json do
          render json: @scope.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /scopes/1
  # PATCH/PUT /scopes/1.json
  def update
    respond_to do |format|
      if @scope.update(scope_params)
        format.html do
          redirect_to @scope, notice: 'Scope was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @scope }
      else
        format.html { render :edit }
        format.json do
          render json: @scope.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /scopes/1
  # DELETE /scopes/1.json
  def destroy
    @scope.destroy
    respond_to do |format|
      format.html do
        redirect_to assets_url, notice: 'Scope was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private # Use callbacks to share common setup or constraints between actions.
  def set_scope
    @scope = Scope.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def scope_params
    params.fetch(:scope, {}).permit(:name, :handle, :description)
  end

  def set_organization
    @organization = Organization.first
  end
end
