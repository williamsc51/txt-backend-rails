class Api::V1::BooksCartProcessor < JSONAPI::Processor
    
  after_find do
    cart = context[:cart]
    @result.meta[:total] = Book.cart(cart.id).total
  end

end