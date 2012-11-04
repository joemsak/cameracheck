class Option < ActiveRecord::Base
  validates :text, :presence => true
  attr_accessible :text
end
