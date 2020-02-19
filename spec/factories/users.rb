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


FactoryBot.define do
    factory :user do
      fname         { Faker::Name.first_name }
      lname         { Faker::Name.last_name }
      email         { Faker::Internet.email }
      password      { Faker::Internet.password }
      created_at    { Faker::Time.between(DateTime.now - 1, DateTime.now)}
      updated_at    { Faker::Time.between(DateTime.now - 1, DateTime.now)}
    end
  end
