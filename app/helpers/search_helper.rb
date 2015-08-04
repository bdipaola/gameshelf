module SearchHelper
  def username_search(username)
    User.find_by(username: username).order(:name)
  end

  def user_name_search(name)
    User.find_by(name: name).order(:name)
  end
end