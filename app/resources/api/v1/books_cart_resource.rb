class Api::V1::BooksCartResource < JSONAPI::Resource
    has_one :book
    has_one :cart

    
end
