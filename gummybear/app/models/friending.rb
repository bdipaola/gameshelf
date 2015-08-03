class Friending < ActiveRecord::Base
  validates_presence_of :user, :friend

  belongs_to :user
  belongs_to :friend, class_name: :User
end
