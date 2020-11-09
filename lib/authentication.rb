module Authentication

  def self.included(base)
    :current_user
  end


  # def admin?
  #   if !logged_in?
  #     false
  #   elsif logged_in? && !current_user.admin
  #     flash[:admin] = "You are not an admin"
  #     # render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
  #     sign_out_and_redirect(current_user)
  #     false
  #   else
  #     true
  #   end
  # end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
