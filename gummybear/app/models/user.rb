class User < ActiveRecord::Base
  validates_presence_of :name, :username, :email
  validates_uniqueness_of :username, :email

  has_many :user_games
  has_many :games, through: :user_games

  has_many :friendings
  has_many :friends, through: :friendings


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

end
