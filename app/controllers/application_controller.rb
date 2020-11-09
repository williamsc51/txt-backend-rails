# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?
  include Authentication
  include ApiFilters

  def check_logged_in
    return if !!current_user

    render json: {status: :unauthorized}
    false
  end

  protected

  def json_request?
    request.format.json?
  end

end
