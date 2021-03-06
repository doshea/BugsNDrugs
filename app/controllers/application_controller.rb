class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate

  private
  def authenticate
    @current_user = User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
    @current_user ||= session[:user_id].present? ? User.find(session[:user_id]) : nil
  end

  def ensure_logged_in
    render text: 'Account Required' unless @current_user
  end
  def ensure_admin
    render text: 'Not Authorized' if (@current_user.nil? || !@current_user.is_admin)
  end

  def alert_js(s)
    render js: "alert('#{s}');"
  end
  def console_js(s)
    render js: "console.log('#{s}');"
  end
end
