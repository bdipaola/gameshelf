module SearchHelper
  def username_search(username)
    User.find_by(username: username).order(:name)
  end

  def user_canonical_username_search(query_term)
    User.where("canonical_username like ?", "%#{query_term.downcase}%").order(:name)
  end

  def user_canonical_name_search(query_term)
    User.where("canonical_name like ?", "%#{query_term.downcase}%").order(:name)
  end

  def game_canonical_name_search(query_term)
    Game.where("canonical_name like ?", "%#{query_term.downcase}%").order(:name)
  end

  def category_canonical_name_search(query_term)
    Category.where("canonical_name like ?", "%#{query_term.downcase}%").order(:name)
  end
end