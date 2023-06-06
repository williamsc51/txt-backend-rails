class SessionsController < ApplicationController

  # layout :none
  def new
    session[:return_to] = params[:return_to] if params[:return_to]
  end

  def create
    user = User.find_by(email: params["email"]).try(:authenticate, params["password"])

    respond_to do |format|
      if user
        session[:user_id] = user.id
        format.html {
          if session[:return_to]
            redirect_to session[:return_to]
          else
            redirect_to root_path
          end
        }
        format.json {
          render json: { status: :created, logged_in: true, user: user}
        }
      else
        format.html {
          flash[:error] = "Login attempt failed"
          render :new
        }
        format.json {
          { status: 401, message: "Invalid Credentials" }
        }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html{
        redirect_to root_path
      }
      format.json {
        render json: { status: 200, message: "Good by for now" }
      }
    end
  end
end
