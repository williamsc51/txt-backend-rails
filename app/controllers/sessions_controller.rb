class SessionsController < ApplicationController

  # layout :none

  def create
    # user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
    user = User.find 2

    if user
      session[:user_id] = user.id
      puts "Session Data: #{session}"
      render json: { status: :created, logged_in: true, user: user}
    else
      render json: { status: 401 }
    end
  end

  def profile
    if current_user
      render json: { logged_in: true, user: current_user}
    else
      render json: { logged_in: false}
    end
  end
end