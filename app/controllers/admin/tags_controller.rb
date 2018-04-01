class Admin::TagsController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render json: Tag.where('name LIKE ?', "%#{params[:term]}%")
      end
    end
  end

  def new
  end

  def edit
  end

  def show
  end
end
