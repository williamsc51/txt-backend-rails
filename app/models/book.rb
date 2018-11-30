class Book < ApplicationRecord
  belongs_to :user
  has_many :covers

end
