class Train < ActiveRecord::Base
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation' #, foreign_key: :current_station_id
  has_many :tickets
  has_many :carriages

  before_create :set_number

  private

  def set_number
    self.number = Train.all.count + 1
  end

  def count_seats(type, seats)
    carriages.where(type: type).sum(seats)
  end

  def count_carriages(type)
    carriages.where(type: type).count
  end
end
