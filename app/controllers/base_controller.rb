# frozen_string_literal: true

class BaseController < ApplicationController
  before_action :store_requested_path
  before_action :login_required
  before_action :is_admin?

  def is_admin?
    unless admin?
      session[:user_id] = nil
      flash[:alert] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end
end
