class Search
  include ActiveModel::Model

  attr_accessor :start_station, :end_station
  attr_accessor :start_station_id, :end_station_id
  attr_accessor :result

  def self.do(params = {})
    search = Search.new(
      start_station_id: params[:start_station_id],
      end_station_id: params[:end_station_id],
    )
    search.start_station = RailwayStation.find(params[:start_station_id])
    search.end_station = RailwayStation.find(params[:end_station_id])
    search.result = search.trains_by_route_station(search.start_station) & search.trains_by_route_station(search.end_station)
    search
  end

  def trains_by_route_station(station)
    Train.includes(route: :railway_stations).where(railway_stations: {id: station.id})
  end
end