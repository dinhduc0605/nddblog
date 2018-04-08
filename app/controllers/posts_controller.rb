class PostsController < ApplicationController
  before_action :set_post, only: :show

  def show
  end

  private

  def set_post
    @post = Post.friendly.find params[:id]
  end
end
