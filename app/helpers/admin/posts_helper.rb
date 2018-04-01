module Admin::PostsHelper
  def background_url post
    post.cover.url || 'grey-background.png'
  end
end
