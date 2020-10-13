class BoxesController < AuthorizationController
  # GET /box/c/:control_id/a/:asset_id
  # GET /box/c/:control_id/a/:asset_id.json
  
  def show
    @control = Control.find(params[:control_id])
    @asset = Asset.find(params[:asset_id])

    @artifacts = Artifact.where(
      control: @control,
      asset: @asset,
      organization: @current_user.organization
    )
  end
end
