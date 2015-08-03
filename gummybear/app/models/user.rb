class User < ActiveRecord::Base
  validates_presence_of :name, :username, :email
  validates_uniqueness_of :username, :email

  has_many :user_games
  has_many :games, through: :user_games

  has_many :friendings
  has_many :friends, through: :friendings
end
