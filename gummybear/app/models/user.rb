class User < ActiveRecord::Base
  has_many :user_games
  has_many :games, through: :user_games

  has_many :friendings
  has_many :friends, through: :friendings

end
