# == Schema Information
#
# Table name: purchases
#
#  id             :bigint           not null, primary key
#  paypay_orderID :string           not null
#  user_id        :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :purchase do
    paypay_orderID { "MyString" }
    user_id { "" }
  end
end
