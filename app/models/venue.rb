class Venue < ActiveRecord::Base
  include AddressLookup::Yelp
  lookup_address_by :name

  default_scope :order => :name

  has_many :options_venues
  has_many :options, :through => :options_venues
  accepts_nested_attributes_for :options

  attr_accessible :name, :options_attributes, :option_ids

  validates :name, :presence => true
end
