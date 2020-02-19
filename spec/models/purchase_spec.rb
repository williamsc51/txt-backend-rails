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

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
