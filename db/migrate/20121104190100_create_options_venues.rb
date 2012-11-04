class CreateOptionsVenues < ActiveRecord::Migration
  def change
    create_table :options_venues do |t|
      t.references :option
      t.references :venue

      t.timestamps
    end
    add_index :options_venues, :option_id
    add_index :options_venues, :venue_id
  end
end
