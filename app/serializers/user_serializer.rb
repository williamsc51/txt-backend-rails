# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  fname           :string
#  lname           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string           default(""), not null
#  admin           :boolean          default(FALSE)
#  password_digest :string
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :fname, :lname
end
