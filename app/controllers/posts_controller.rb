class PostsController < ApplicationController
  before_action :set_post, only: :show

  def show
  end

  def techniques
    @technique_posts = Post.where(category: 0).first(5)
  end

  def life_stories
    @life_posts = Post.where(category: 1).first(5)
  end

  def japan
    @japan_posts = Post.where(category: 2).first(5)
  end

  private

  def set_post
    @post = Post.find params[:id]
  end
end
