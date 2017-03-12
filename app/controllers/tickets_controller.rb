class TicketsController < ApplicationController
  before_action :pre_order, only: [:new, :create]

  def new
    @ticket = Ticket.new(new_ticket_params)
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def pre_order
    @train = Train.find(new_ticket_params[:train_id])
    @start_station = RailwayStation.find(new_ticket_params[:start_station_id])
    @end_station = RailwayStation.find(new_ticket_params[:end_station_id])
  end

  def new_ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id)
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :passenger_name, :passenger_passport)
  end
end