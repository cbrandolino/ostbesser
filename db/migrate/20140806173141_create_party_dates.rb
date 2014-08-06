class CreatePartyDates < ActiveRecord::Migration
  def change
    create_table :party_dates do |t|
      t.date :night_start
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
