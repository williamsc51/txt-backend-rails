# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  fname                  :string
#  lname                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  authentication_token   :string(30)
#  admin                  :boolean          default(FALSE)
#


# User model
class User < ApplicationRecord
  has_secure_password
  validates :fname, :lname, presence: true, length: { minimum: 2 }
  validates :email, uniqueness: { case_sensitive: false }, presence: true

  has_many :books
  has_one :cart
  has_many :purchases
end
