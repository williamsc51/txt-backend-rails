class Api::V1::ProfilesController < ApplicationController

  def show
    if current_user
      @user = current_user
      render json: @user
    else
      render json: {status: :unauthorized}
    end
  end

end
