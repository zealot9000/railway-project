class RailwayStation < ActiveRecord::Base
  validates :title, presence: true

  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route , position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end  

  def position_in(route)
    station_route(route).try(:position)
  end  

  def update_time(route, arrival, departure)
    station = route_station(route)
    station.update(arrival: arrival, departure: departure) if station
  end

  def time(route, time_type)
    station_route(route).try(time_type)
  end

private

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end  
end
