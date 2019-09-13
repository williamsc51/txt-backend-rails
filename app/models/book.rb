class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :cart
  has_many :thumbnails

end
