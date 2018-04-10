class TagsController < ApplicationController
  before_action :set_tag

  def show
    if params[:post_id]
      @posts = Post.includes(:tags).where("posts.id < ?", params[:post_id]).where(:tags => { id: @tag.id }).order(created_at: :desc).limit(5)
    else
      @posts = Post.includes(:tags).where(:tags => { id: @tag.id }).order(created_at: :desc).limit(5)
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
