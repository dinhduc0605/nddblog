module Admin::UsersHelper
  def avatar_url user
    user.avatar.url || "anonymous_user.png"
  end
end
