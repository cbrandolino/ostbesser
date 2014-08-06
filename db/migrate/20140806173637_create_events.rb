class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :time_start
      t.datetime :time_end
      t.references :location, index: true
      t.references :party_date, index: true

      t.timestamps
    end
  end
end
