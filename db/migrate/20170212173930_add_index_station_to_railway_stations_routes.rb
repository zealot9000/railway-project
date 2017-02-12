class AddIndexStationToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :index_station, :integer
  end
end
