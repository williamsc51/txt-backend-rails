class Api::V1::CartResource < JSONAPI::Resource
    has_many :books
    has_one :user
end
