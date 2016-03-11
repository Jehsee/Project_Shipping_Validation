module HomeHelper
  def myProfileLink
    link_to("My Profile", profile_path(current_user.id), method: :get)
  end

  def jobsLink
    link_to("Jobs", jobs_path, method: :get)
  end

  def logoutLink
    link_to("Logout", destroy_user_session_path, method: :delete)
  end

  def profilesLink
    link_to("All Profiles", profiles_path, method: :get)
  end
end
