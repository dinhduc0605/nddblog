class StaticPagesController < ApplicationController
  layout false, only: :about

  def home
    if params[:id]
      @new_posts = Post.where("id < ?", params[:id]).order(created_at: :desc).limit(5)
    else
      @new_posts = Post.order(created_at: :desc).limit(5)
    end
    respond_to do |format|
      format.html
      format.js { render 'load_more.js.erb', locals: { posts: @new_posts } }
    end
  end

  def about
  end

  def techniques
    if params[:id]
      @technique_posts = Post.where("id < ? and category = ?", params[:id], 0).order(created_at: :desc).limit(5)
    else
      @technique_posts = Post.where(category: 0).order(created_at: :desc).limit(5)
    end
    respond_to do |format|
      format.html
      format.js { render 'load_more.js.erb', locals: { posts: @technique_posts } }
    end
  end

  def life_stories
    if params[:id]
      @life_posts = Post.where("id < ? and category = ?", params[:id], 1).order(created_at: :desc).limit(5)
    else
      @life_posts = Post.where(category: 1).order(created_at: :desc).limit(5)
    end
    respond_to do |format|
      format.html
      format.js { render 'load_more.js.erb', locals: { posts: @life_posts } }
    end
  end

  def japan
    if params[:id]
      @japan_posts = Post.where("id < ? and category = ?", params[:id], 2).order(created_at: :desc).limit(5)
    else
      @japan_posts = Post.where(category: 2).order(created_at: :desc).limit(5)
    end
    respond_to do |format|
      format.html
      format.js { render 'load_more.js.erb', locals: { posts: @japan_posts } }
    end
  end
end
