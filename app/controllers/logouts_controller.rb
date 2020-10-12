class LogoutsController < AuthorizationController
  def new
    cookies.delete :user_id
    redirect_to login_url, notice: 'Logout successful'
  end
end