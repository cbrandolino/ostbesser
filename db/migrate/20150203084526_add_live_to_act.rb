class AddLiveToAct < ActiveRecord::Migration
  def change
    add_column :acts, :live, :boolean
  end
end
