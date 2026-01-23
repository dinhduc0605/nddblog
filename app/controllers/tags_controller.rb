# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :set_tag

  def show
    @posts = Post.published.joins(:tags).where(tags: {id: @tag.id})
    @posts = @posts.where('posts.id < ?', params[:last_post_id]) if params[:last_post_id]
    @posts = @posts.order(id: :desc).limit(5)
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
