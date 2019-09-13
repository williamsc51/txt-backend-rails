class Api::V1::CartController < JSONAPI::ResourceController
    skip_before_action :verify_authenticity_token

    def context 
        @user_id = params[:user_id]
        @user = User.find(@user_id)
        { user: @user }
    end

    private

    def user_params
        params.require(:filter).permit(:user_id)
    end
end
