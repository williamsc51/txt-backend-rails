# == Schema Information
#
# Table name: carts
#
#  id          :bigint           not null, primary key
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  books_count :integer          default(0), not null
#

class CartSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :sub_total, :data

  def data
    object.books_carts.map do |cart_item|
      {
        cart_item_id: cart_item.id,
        book: cart_item.book,
        quantity: cart_item.quantity,
        total: cart_item.total_price
      }
    end
  end
end
