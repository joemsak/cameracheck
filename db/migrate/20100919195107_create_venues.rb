class CreateVenues < ActiveRecord::Migration

  def self.up
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.text :camera_rules
      t.integer :position

      t.timestamps
    end

    add_index :venues, :id

    load(Rails.root.join('db', 'seeds', 'venues.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Venues"})

    Page.delete_all({:link_url => "/venues"})

    drop_table :venues
  end

end
