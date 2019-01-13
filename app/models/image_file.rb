class ImageFile < ApplicationRecord
  mount_uploader :image, AvatarUploader
end
