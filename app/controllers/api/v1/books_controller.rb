class Api::V1::BooksController < Api::V1::ResourceBaseController
    skip_before_action :verify_authenticity_token

end
