class TagsController < ApplicationController
  before_action :set_tag

  def show
    if params[:last_post_id]
      @posts = Post.joins(:tags).where(:tags => { id: @tag.id }).where("posts.id < ?", params[:last_post_id]).order(id: :desc).limit(5)
    else
      @posts = Post.joins(:tags).where(:tags => { id: @tag.id }).order(id: :desc).limit(5)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_tag
    @tag = Tag.friendly.find params[:id]
  end
end
