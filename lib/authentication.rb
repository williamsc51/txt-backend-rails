# frozen_string_literal: true

module Authentication
  def self.included(base)
    base.__send__ :helper_method, :current_user, :logged_in?
  end

  def admin?
    current_user&.admin?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def login_required
    return if logged_in?
    
    redirect_to new_session_path
  end
end
