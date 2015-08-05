class User < ActiveRecord::Base
  validates_presence_of :name, :username, :email
  validates_uniqueness_of :username, :email

  before_create :add_canonical_name
  before_create :add_canonical_username

  has_many :user_games
  has_many :games, through: :user_games

  has_many :friendings
  has_many :friends, through: :friendings

  has_many :comments


  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(raw_password)
    @password = BCrypt::Password.create(raw_password)
    self.password_hash = @password
  end

  def authenticate(raw_password)
    password == raw_password
  end

  def add_canonical_name
    self.canonical_name = self.name.downcase
  end

  def add_canonical_username
    self.canonical_username = self.username.downcase
  end

  def friends_with_game(game)
    self.friends.select do |friend|
      friend_has_game?(friend, game)
    end
  end

  def friend_has_game?(friend, game)
    friend.game_ids.include?(game.id)
  end

end
