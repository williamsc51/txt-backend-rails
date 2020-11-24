# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  title       :string(80)       not null
#  author      :string(50)       not null
#  isbn        :bigint
#  price       :float            not null
#  description :string
#  condition   :string
#  thumbnail   :string           default("")
#  category    :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Book < ApplicationRecord
  validates :title, :author, :price, presence: true

  belongs_to :user
  has_and_belongs_to_many :cart
  has_one_attached :image

  scope :cart, lambda {|query| joins(:cart).where("cart_id = ?", "#{query}")}

  def self.total
    sum(:price)
  end

end
