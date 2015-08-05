class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :canonical_name
  validates_uniqueness_of :name

  before_create :add_canonical_name

  def add_canonical_name
    self.canonical_name = self.name.downcase
  end
end
