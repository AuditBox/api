class ApplicationController < ActionController::Base
  def current_user
    return nil unless user_id = cookies.signed[:user_id]
    @current_user ||= User.find(user_id)
  end
end
