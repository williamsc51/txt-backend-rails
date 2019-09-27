class Cart < ApplicationRecord
    belongs_to :user, optional: true
    has_and_belongs_to_many :books

    validates :user_id, uniqueness: true
end
