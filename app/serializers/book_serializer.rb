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
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BookSerializer < ActiveModel::Serializer

  attributes :id, :title, :author, :isbn, :price, :description, :condition, :category, :image

  def image
    if object.image.attached?
      if Rails.env.development?
        "http://localhost:3000#{Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)}"
      end
      #TODO add production path when deployed
    end
  end
end
