# frozen_string_literal: true

# == Schema Information
#
# Table name: covers
#
#  id         :bigint           not null, primary key
#  cover      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


# Cover model
class Cover < ApplicationRecord
  mount_uploader :cover, ImageUploader
end
