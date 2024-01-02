# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?
  include Authentication
  include ApiFilters

  def store_requested_path
    session[:requested_path] = request.fullpath unless current_user
  end

  protected

  def json_request?
    request.format.json?
  end
end
