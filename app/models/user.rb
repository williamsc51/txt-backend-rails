# frozen_string_literal: true

# User model
class User < ApplicationRecord
  validates :fname, :lname, presence: true, length: { minimum: 2 }
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
  has_many :purchases
end
