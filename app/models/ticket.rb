class Ticket < ActiveRecord::Base
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  after_create :send_create_notification
  after_destroy :send_destroy_notification

  validates :passenger_name, :passenger_passport, presence: true

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end  

  private

  def send_create_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end  

  def send_destroy_notification
    TicketsMailer.destroy_ticket(self.user, self).deliver_now
  end
end
