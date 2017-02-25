class RenameIndexStationToPosition < ActiveRecord::Migration
  def change
    rename_column :railway_stations_routes, :index_station, :position
  end
end
