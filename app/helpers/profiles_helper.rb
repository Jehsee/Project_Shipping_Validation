module ProfilesHelper

  def followersLink
    link_to("Who am I following?", follower_path(current_user.id), method: :get)
  end

end
