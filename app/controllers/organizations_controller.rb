class OrganizationsController < AuthorizationController
  before_action :set_organization, only: %i[show edit update destroy]
  skip_before_action :require_organization, only: %i[new create] # GET /organizations/1.json
  def show; end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit; end

  # POST /organizations
  # POST /organizations.json
  def create
    return redirect_to(controls_url) unless @current_user.organization.nil?

    saved = false

    Organization.transaction do
      @organization = Organization.new(organization_params)
      @current_user.organization = @organization
      org_saved = @organization.save!
      user_saved = @current_user.save!
      saved = org_saved && user_saved
    end

    respond_to do |format|
      if saved
        format.html do
          redirect_to controls_url,
                      notice: 'Organization was successfully created.'
        end
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json do
          render json: @organization.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html do
          redirect_to @organization,
                      notice: 'Organization was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json do
          render json: @organization.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html do
        redirect_to organizations_url,
                    notice: 'Organization was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def organization_params
    params.fetch(:organization, {}).permit(:name)
  end
end
