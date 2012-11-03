class Venue < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  include AddressLookup::Yelp
  lookup_address_by :name

end
