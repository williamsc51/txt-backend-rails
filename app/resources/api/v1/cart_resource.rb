class Api::V1::CartResource < JSONAPI::Resource
    has_many :books
    
    singleton singleton_key: -> (context) {
        key = context[:user].try(:cart).try(:id)
        raise JSONAPI::Exceptions::RecordNotFound.new(nil) if key.nil?
        key
    }

    has_one :user, :foreign_key_on => :related, class_name: "User"

    # def self.find_by_key(key, options = {})
    #     context = options[:context]
    #     model = context[:user]
    #     fail JSONAPI::Exceptions::RecordNotFound.new(key) if model.nil?
    #     resource_for_model(model).new(model, context)
    # end
end
