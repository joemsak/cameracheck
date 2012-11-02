class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name,    :null => false
      t.string :address
    end
  end
end
