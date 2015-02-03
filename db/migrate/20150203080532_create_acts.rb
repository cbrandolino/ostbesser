class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :event_id
      t.integer :room_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
