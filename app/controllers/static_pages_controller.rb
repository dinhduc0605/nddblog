# frozen_string_literal: true

# Controller for client static page
class StaticPagesController < ApplicationController
  layout false, only: :about
  before_action :set_category, only: :show_category

  POST_LIMIT = 2

  def home
    published_posts = Post.published
    filter_posts(published_posts)
  end

  def show_category
    published_posts = @category.posts.published
    filter_posts(published_posts)
  end

  def about; end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def filter_posts(published_posts)
    @posts = if params[:last_post_id]
               published_posts.where('id < ?', params[:last_post_id]).order(id: :desc)
             else
               published_posts.order(id: :desc)
             end
    @posts = @posts.limit(POST_LIMIT)
    @load_done = !published_posts.exists?(['id < ?', @posts.last&.id])
    respond_to do |format|
      format.html
      format.js {render 'load_more.js.erb', locals: {posts: @posts, load_done: @load_done}}
    end
  end
end
