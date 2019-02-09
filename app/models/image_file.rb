# frozen_string_literal: true

class ImageFile < ApplicationRecord
  mount_uploader :image, AvatarUploader
end
