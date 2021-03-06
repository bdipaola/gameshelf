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

  def game_search(query)
    terms = query.split(' ')
    results = []
    terms.each do |term|
      if results.empty?
        results += game_canonical_name_search(term)
      else
        results &= game_canonical_name_search(term)
      end
    end
    sort_by_name(results.uniq)
  end

  def user_search(query)
    terms = query.split(' ')
    results = []
    terms.each do |term|
      if results.empty?
        results += user_canonical_name_search(term)
      else
        results &= user_canonical_name_search(term)
      end

      if results.empty?
        results += user_canonical_username_search(term)
      else
        results &= user_canonical_username_search(term)
      end
    end
    sort_by_name(results.uniq)
  end

  def category_search(query)
    terms = query.split(' ')
    results = []
    terms.each do |term|
      if results.empty?
        results += category_canonical_name_search(term)
      else
        results &= category_canonical_name_search(term)
      end
    end
    sort_by_name(results.uniq)
  end

  def sort_by_name(object_array)
    object_array.uniq.sort do |a, b|
      a.name <=> b.name
    end
  end

  def player_count_search(num_players)
    Game.all.select do |game|
      game.min_players <= num_players && game.max_players >= num_players
    end
  end

  def get_num_players(query)
    if /\A\d+\z/ =~ query
      query.to_i
    else
      nil
    end
  end
end