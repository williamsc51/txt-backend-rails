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

FactoryBot.define do
  factory :cart do
    user_id { 1 }
    book_id { 1 }
  end
end
