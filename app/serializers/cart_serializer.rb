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
  attributes :id, :user_id, :books_count
  has_many :books
end
