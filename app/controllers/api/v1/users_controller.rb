class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
      @users = User.all
  
      render json: @users
    end
    
    def create
      @users = Cover.new(user_params_attributes)

      if @user.save
        render json: @users, status: :created
      else
        render json: @users.errors, status: :unprocessable_entity
      end
    end

    def show
      render json: @users
    end

private
    def set_user
      @users = User.find(params[:id])
    end

    def user_params
      params.require(:data).permit(:type, attributes: [:fname, :lname, :email])
    end

    def user_params_attributes
      user_params[:attributes] || {}
    end
end
