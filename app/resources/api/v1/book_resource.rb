class Api::V1::BookResource < JSONAPI::Resource
  attributes :title, :author, :isbn, :price, :description, :condition, :thumbnail, :category, :user_id, :created_at
  has_one :user

  def fetchable_fields
      super - [:user_id]
    end

    filter :id
end
