class Api::V1::UsersController < Api::V1::ResourceBaseController
    skip_before_action :verify_authenticity_token
end
