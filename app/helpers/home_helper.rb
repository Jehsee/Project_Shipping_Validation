module HomeHelper
  def myProfileLink
    link_to("Profile", profile_path(current_user.id), method: :get)
  end

  def jobsLink
    link_to("Jobs", jobs_path, method: :get)
  end

  def logoutLink
    link_to("Logout", destroy_user_session_path, method: :delete)
  end
end
