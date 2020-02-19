# == Schema Information
#
# Table name: covers
#
#  id         :bigint           not null, primary key
#  cover      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CoverSerializer < ActiveModel::Serializer
  attributes :id, :cover
end
