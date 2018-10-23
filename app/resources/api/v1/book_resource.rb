class Api::V1::BookResource < JSONAPI::Resource
  attributes :title, :author, :isbn, :price, :description, :condition, :cover, :category, :user_id
  has_one :user

  def fetchable_fields
      super - [:user_id]
    end
end
