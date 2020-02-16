class Api::V1::BooksCartsController < Api::V1::ResourceBaseController
    skip_before_action :verify_authenticity_token

    def context
        @cart_id = Cart.find_by_id(params[:filter][:cart_id])
        { 
            cart: @cart_id
        }
    end

    
end
