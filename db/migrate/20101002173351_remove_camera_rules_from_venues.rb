class RemoveCameraRulesFromVenues < ActiveRecord::Migration
  def self.up
    remove_column :venues, :camera_rules
    add_column :venues, :point_and_shoot, :boolean
    add_column :venues, :slr, :boolean
    add_column :venues, :flash, :boolean
  end

  def self.down
    add_column :venues, :camera_rules, :text
    remove_column :venues, :point_and_shoot
    remove_column :venues, :slr
    remove_column :venues, :flash
  end
end
