class Api::V1::CartController < JSONAPI::ResourceController
    skip_before_action :verify_authenticity_token

    def context
        @user_id = User.find_by_id(params[:user_id])
        { user: @user_id }
    end

end
