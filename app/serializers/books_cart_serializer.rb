# == Schema Information
#
# Table name: books_carts
#
#  id         :bigint           not null, primary key
#  book_id    :bigint
#  cart_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#

class BooksCartSerializer < ActiveModel::Serializer
  attributes :id, :book_id, :cart_id, :book

  def book
    BookSerializer.new(object.book)
  end
end
