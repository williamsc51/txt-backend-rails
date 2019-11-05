class Api::V1::BooksCartResource < JSONAPI::Resource
    attributes :book_id, :cart_id
    has_one :book
    has_one :cart

    
end
