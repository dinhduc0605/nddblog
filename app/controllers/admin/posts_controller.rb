# frozen_string_literal: true

class Admin::PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy show]
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_admin_user
    @tags = []
    params[:tags].split(',').each do |tag|
      @tags << Tag.find_or_create_by(name: tag)
    end
    @post.tags = @tags
    if @post.save
      redirect_to admin_post_path(@post), notice: t('.notice')
    else
      render :new
    end
  end

  def edit; end

  def update
    @tags = []
    params[:tags].split(',').each do |tag|
      @tags << (Tag.exists?(name: tag) ? Tag.find_by(name: tag) : Tag.create(name: tag))
    end
    @post.tags = @tags
    if @post.update post_params
      redirect_to admin_post_path(@post), notice: t('.notice')
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @post.destroy
      redirect_to admin_posts_path, notice: t('.notice')
    else
      redirect_to admin_posts_path, alert: t('.alert')
    end
  end

  protected

  def set_post
    @post = Post.friendly.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :cover, :tag, :description, :published)
  end
end
