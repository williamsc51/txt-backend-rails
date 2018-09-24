class Api::V1::UserResource < JSONAPI::Resource
  attributes :fname, :lname, :email, :password
  has_many :books

  # def fetchable_fields
  #     super - [:password]
  #   end
end
