class Api::V1::TokenController < ApiController

  def create
    user = User.where(email: params[:username]).first

    if user&.valid_password?(params[:password])
      render json: user.as_json(only: [:id, :email, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

end
