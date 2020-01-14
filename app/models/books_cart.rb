class BooksCart < ApplicationRecord
  belongs_to :book
  belongs_to :cart, counter_cache: :books_count
end
