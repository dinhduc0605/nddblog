class StaticPagesController < ApplicationController
  layout false, only: :about

  def home
    @new_posts = Post.limit(5)
  end

  def about
  end
end
