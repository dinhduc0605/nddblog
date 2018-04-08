class TagsController < ApplicationController
  before_action :set_tag

  def show
    @posts = @tag.posts
  end

  private

  def set_tag
    @tag = Tag.find params[:id]
  end
end
