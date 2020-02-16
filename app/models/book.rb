class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :cart
  has_many :thumbnails

  scope :cart, lambda {|query| joins(:cart).where("cart_id = ?", "#{query}")}

  def self.total
    sum(:price)
  end

end
