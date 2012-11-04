class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :text, :null => false

      t.timestamps
    end
  end
end
