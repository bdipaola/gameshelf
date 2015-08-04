class Comment < ActiveRecord::Base
  validates_presence_of :user, :game, :content

  belongs_to :user
  belongs_to :game
end
