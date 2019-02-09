# frozen_string_literal: true

class Admin::ImageFilesController < ApplicationController
  def create
    params[:images].each do |image|
      ImageFile.create(image: image)
    end
    @image_files = ImageFile.order(id: :desc).limit(5)
  end
end
