class LoginsController < ApplicationController
  def new
    redirect_to controls_url if current_user
  end

  def create    
    if user = authenticate_with_google
      cookies.signed[:user_id] = user.id
      redirect_to controls_url
    else
      redirect_to create_login_url, alert: 'authentication_failed'
    end
  end

  private
    def authenticate_with_google
      if id_token = flash["google_sign_in"]["id_token"]
        login id_token        
      elsif error = flash["google_sign_in"][":error"]
        logger.error "Google authentication error: #{error}"
        nil
      end
    end

    def login(token)
      identity = GoogleSignIn::Identity.new token
      
      user = User.find_or_initialize_by google_id: identity.user_id
      user.email = identity.email_address
      user.name = identity.name
      user.save!
      user
    end
end