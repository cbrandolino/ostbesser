class AddBerghainIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :berghain_id, :int
  end
end
