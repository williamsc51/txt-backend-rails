class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params["email"]).try(:authenticate, params["password"])

    respond_to do |format|
      if user
        session[:user_id] = user.id
        format.html {
          redirect_path = session[:requested_path] || books_path
          session[:requested_path] = nil  # Clear the stored path after redirection
          flash[:notice] = "You have successfuly login"
          redirect_to redirect_path
        }
        format.json {
          render json: { status: :created, user: UserSerializer.new(user).serializable_hash.except(:books)}
        }
      else
        format.html {
          flash[:alert] = "Login attempt failed"
          render :new, status: :forbidden
        }
        format.json {
          render json: { status: 401, message: "Invalid Credentials" }
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
