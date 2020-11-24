# frozen_string_literal: true

module Authentication
  def admin?
    if !logged_in?
      false
    elsif logged_in? && !current_user.admin
      render json: { status: :unauthorized }
      false
    else
      true
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
