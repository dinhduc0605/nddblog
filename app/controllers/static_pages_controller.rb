class StaticPagesController < ApplicationController
  layout false, only: :home
  def home
    @new_posts = Post.limit(5)
    @hot_posts = Post.limit(5)
  end
end
