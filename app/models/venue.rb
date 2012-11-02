class Venue < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  geocoded_by         :name_and_city
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode
  after_validation :reverse_geocode

  def name_and_city
    "#{name} New York"
  end
end
