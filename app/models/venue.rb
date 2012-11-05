class Venue < ActiveRecord::Base
  include AddressLookup::Yelp
  lookup_address_by :name

  default_scope :order => :name

  has_many :options_venues, :dependent => :destroy
  has_many :options, :through => :options_venues, :uniq => true
  accepts_nested_attributes_for :options, :reject_if => Proc.new { |o| o[:text].blank? }

  attr_accessible :name, :address, :options_attributes, :option_ids

  validates :name, :presence => true
end
