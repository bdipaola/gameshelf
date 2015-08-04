class UserGame < ActiveRecord::Base
  validates_presence_of :game, :user

  belongs_to :game
  belongs_to :user
end
