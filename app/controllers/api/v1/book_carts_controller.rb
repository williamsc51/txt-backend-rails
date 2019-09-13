class Api::V1::BookCartsController < JSONAPI::ResourceController
    skip_before_action :verify_authenticity_token

    
end
