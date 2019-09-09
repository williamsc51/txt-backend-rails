class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :carts
  has_many :thumbnails

end
