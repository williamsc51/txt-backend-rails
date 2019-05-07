# frozen_string_literal: true

# Cover model
class Cover < ApplicationRecord
  mount_uploader :cover, ImageUploader
end
