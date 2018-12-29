# frozen_string_literal: true

module ImageHelper
  def image_url(image)
    image.url || 'grey-background.png'
  end
end
