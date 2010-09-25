class Venue < ActiveRecord::Base
 # acts_as_commentable
  
  acts_as_indexed :fields => [:name, :address, :camera_rules]
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  default_scope :order => 'name ASC'


end
