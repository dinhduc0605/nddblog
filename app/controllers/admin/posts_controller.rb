class Admin::PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:success] = 'asdsdf'
      redirect_to admin_posts_path
    else
      flash[:danger]  = 'dafsdf'
      render :new
    end
  end

  def edit
  end

  def show
  end

  protected
  def post_params
    params.require(:post).permit(:title, :content, :category, :cover)
  end
end
