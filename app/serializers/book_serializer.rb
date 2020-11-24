# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  title       :string(80)       not null
#  author      :string(50)       not null
#  isbn        :bigint
#  price       :float            not null
#  description :string
#  condition   :string
#  thumbnail   :string           default("")
#  category    :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BookSerializer < ActiveModel::Serializer

  attributes :id, :title, :author, :isbn, :price, :description, :condition, :category, :image

  belongs_to :user

  def image
    if object.image.attached?
      object.image.service_url
    end
  end
end
