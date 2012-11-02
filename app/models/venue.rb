class Venue < ActiveRecord::Base
  validates :name, :presence => true
end
