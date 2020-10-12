class AuthorizationController < ApplicationController
  before_action :authorize
  before_action :require_organization

  def authorize
    redirect_to(login_url, notice: 'You must be logged in to access this page!') unless current_user
  end

  def require_organization
    redirect_to(new_organization_url) unless current_user.organization
  end
end
