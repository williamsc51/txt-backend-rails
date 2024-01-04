class Api::V1::UsersController < ApplicationController
    before_action :check_login, only: [:show, :update]
    before_action :set_user, except: [:create]
    
    def create
      user = User.new(user_params_attributes)

      if user.save
        render json: user, status: :created
      else
        render json:  {error_messages: user.errors}, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params_attributes)
        render json: @user
      else
        render json: {error_messages: @user.errors}, status: :unprocessable_entity
      end
    end

    def show
      return render json: @user if @user

      render json: {message: "not found"}, status: 404
    end

private

    def check_login
      if logged_in? && current_user.id == params[:id].to_i
        true
      else
        render json: {message: "unauthorized"}, status: 401
        false
      end
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:data).permit(:type, attributes: [:fname, :lname, :email, :password])
    end

    def user_params_attributes
      user_params[:attributes] || {}
    end
end
