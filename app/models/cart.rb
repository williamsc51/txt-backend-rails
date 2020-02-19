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
    has_and_belongs_to_many :books

    validates :user_id, uniqueness: true
end
