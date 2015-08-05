class Game < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_uniqueness_of :name

  before_create :add_canonical_name

  belongs_to :category
  has_many :user_games
  has_many :users, through: :user_games

  has_many :comments

  def add_canonical_name
    self.canonical_name = self.name.downcase
  end
end
