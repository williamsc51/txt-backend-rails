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

class BooksCart < ApplicationRecord
  validates :book_id, :cart_id, presence: true

  belongs_to :book
  belongs_to :cart

  def total_price
    self.quantity * self.book.price
  end
end
