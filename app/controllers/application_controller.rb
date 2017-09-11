class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def sign_in(user)
    token = SecureRandom.urlsafe_base64
    session[:token] = token
    # user.update!(session_token: token)
    user.update_attribute(:session_token, token)
  end

  def sign_out
    current_user.update_attribute(:session_token)
    session.delete(:token)
  end

  def current_user
    token = session[:token]
    return nil if token.nil?
    User.find_by(session_token: token)
  end

  def ensure_logged_in
    return if current_user
    flash[:error] = "you need to log in"
    redirect_to session_path
  end

end
