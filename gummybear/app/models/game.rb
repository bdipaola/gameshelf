class Game < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_uniqueness_of :name

  belongs_to :category
  has_many :user_games
  has_many :users, through: :user_games
end
