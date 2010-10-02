class RenameVenueFields < ActiveRecord::Migration
  def self.up
    rename_column :venues, :point_and_shoot, :allows_point_and_shoot
    rename_column :venues, :slr, :allows_slr
    rename_column :venues, :flash, :allows_flash
  end

  def self.down
    rename_column :venues, :allows_point_and_shoot, :point_and_shoot
    rename_column :venues, :allows_slr, :slr
    rename_column :venues, :allows_flash, :flash
  end
end
