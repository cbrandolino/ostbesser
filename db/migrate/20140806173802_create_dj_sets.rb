class CreateDjSets < ActiveRecord::Migration
  def change
    create_table :dj_sets do |t|
      t.string :type
      t.datetime :time_start
      t.datetime :time_end
      t.references :artist, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
