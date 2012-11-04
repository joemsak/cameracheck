class Venue < ActiveRecord::Base
  default_scope :order => :name

  attr_accessible :name

  validates :name, :presence => true

  include AddressLookup::Yelp
  lookup_address_by :name
end
