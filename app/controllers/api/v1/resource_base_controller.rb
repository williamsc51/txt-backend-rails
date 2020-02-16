class Api::V1::ResourceBaseController < JSONAPI::ResourceController
  
    def context
        @user_id = User.find_by_id(params[:user_id])
        { user: @user_id }
    end
end