class StaticPagesController < ApplicationController
  layout false, only: :about

  def home
    if params[:last_post_id]
      @new_posts = Post.where("id < ?", params[:last_post_id]).order(id: :desc).limit(5)
    else
      @new_posts = Post.order(id: :desc).limit(5)
    end
    respond_to do |format|
      format.html
      format.js { render 'load_more.js.erb', locals: { posts: @new_posts } }
    end
  end

  def about
  end

  def techniques
    if params[:last_post_id]
      @technique_posts = Post.where("id < ? and category = ?", params[:last_post_id], 0).order(id: :desc).limit(5)
    else
      @technique_posts = Post.where(category: 0).order(id: :desc).limit(5)
    end
    respond_to do |format|
      format.html
      format.js { render 'load_more.js.erb', locals: { posts: @technique_posts } }
    end
  end

  def life_stories
    if params[:last_post_id]
      @life_posts = Post.where("id < ? and category = ?", params[:last_post_id], 1).order(id: :desc).limit(5)
    else
      @life_posts = Post.where(category: 1).order(id: :desc).limit(5)
    end
    respond_to do |format|
      format.html
      format.js { render 'load_more.js.erb', locals: { posts: @life_posts } }
    end
  end

  def japan
    if params[:last_post_id]
      @japan_posts = Post.where("id < ? and category = ?", params[:last_post_id], 2).order(id: :desc).limit(5)
    else
      @japan_posts = Post.where(category: 2).order(id: :desc).limit(5)
    end
    respond_to do |format|
      format.html
      format.js { render 'load_more.js.erb', locals: { posts: @japan_posts } }
    end
  end
end
