class Option < ActiveRecord::Base
  validates :text, :presence => true, :uniqueness => true
  attr_accessible :text

  has_many :options_venues, :dependent => :destroy
  has_many :venues, :through => :options_venues
end
