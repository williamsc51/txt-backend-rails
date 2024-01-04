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

class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :books_carts, dependent: :destroy
  has_many :books, through: :books_carts

  def sub_total
    sum = 0
    self.books_carts.each do |cart_item|
      sum += cart_item.total_price
    end
    
    sum
  end
end
