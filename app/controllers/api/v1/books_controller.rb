class Api::V1::BooksController < JSONAPI::ResourceController
    skip_before_action :verify_authenticity_token

end
