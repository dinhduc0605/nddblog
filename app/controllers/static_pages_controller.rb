class StaticPagesController < ApplicationController
  layout false, only: :about

  def home
    @new_posts = Post.limit(5)
  end

  def about
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
end
