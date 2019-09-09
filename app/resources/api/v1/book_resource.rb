class Api::V1::BookResource < JSONAPI::Resource
  attributes  :title, :author, :isbn, :price, :description, :condition, :thumbnail, :category, :user_id, :created_at
  has_one :user
  has_many :carts

  def fetchable_fields
      super - [:user_id]
  end

    filters :id, :category, :price
    
    # search for a book by its title
    filter :title, verify: ->(values, context) {
        "%#{values[0].downcase}%"
    }, apply: ->(records, value, _options) {
      records.where("lower(books.title) LIKE ? ", value) 
    }    

    # allow you to set limit
    paginator :offset
end
