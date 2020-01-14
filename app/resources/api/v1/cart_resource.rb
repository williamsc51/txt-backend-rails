class Api::V1::CartResource < JSONAPI::Resource
    attributes :user_id, :books_count
    has_many :books
    has_one :user
    
    singleton singleton_key: -> (context) {
        key = context[:user].try(:cart).try(:id)
        raise JSONAPI::Exceptions::RecordNotFound.new(nil) if key.nil?
        key
    }

    

end
