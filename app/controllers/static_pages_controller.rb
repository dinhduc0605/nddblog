# frozen_string_literal: true

# Controller for client static page
class StaticPagesController < ApplicationController
  layout false, only: :about
  before_action :set_category, only: :show_category

  POST_LIMIT = 10

  def home
    @new_posts = if params[:last_post_id]
                   Post.published.where('id < ?', params[:last_post_id]).order(id: :desc)
                 else
                   Post.published.order(id: :desc)
                 end
    @new_posts = @new_posts.limit(POST_LIMIT)
    respond_to do |format|
      format.html
      format.js {render 'load_more.js.erb', locals: {posts: @new_posts}}
    end
  end

  def show_category
    published_posts = @category.posts.published
    @posts = if params[:last_post_id]
               published_posts.where('id < ?', params[:last_post_id]).order(id: :desc)
             else
               published_posts.order(id: :desc)
             end
    @posts = @posts.limit(POST_LIMIT)
    respond_to do |format|
      format.html
      format.js {render 'load_more.js.erb', locals: {posts: @posts}}
    end
  end

  def about; end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end
