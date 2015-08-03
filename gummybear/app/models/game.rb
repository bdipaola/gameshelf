class Game < ActiveRecord::Base
  belongs_to :category
  has_many :user_games
  has_many :users, through: :user_games
end
