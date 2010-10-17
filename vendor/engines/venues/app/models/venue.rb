class Venue < ActiveRecord::Base
 # acts_as_commentable
  
  acts_as_indexed :fields => [:name, :address, :camera_rules]
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  default_scope :order => 'name ASC'
  
  has_friendly_id :name, :use_slug => true
  
  def camera_rules
    [allows_point_and_shoot, allows_slr, allows_flash].reject { |allowed| not allowed or allowed.nil? }
  end

end
