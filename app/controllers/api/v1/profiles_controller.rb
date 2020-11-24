class Api::V1::ProfilesController < ApplicationController

  before_action :check_logged_in

  def show
    @user = current_user
    render json: @user
  end

end
