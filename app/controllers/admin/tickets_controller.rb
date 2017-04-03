class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :pre_order, only: [:new, :create]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new(new_ticket_params)
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to [:admin, @ticket], notice: 'Successfully purchased ticket'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket]
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def pre_order
    @train = Train.find(new_ticket_params[:train_id])
    @start_station = RailwayStation.find(new_ticket_params[:start_station_id])
    @end_station = RailwayStation.find(new_ticket_params[:end_station_id])
  end

  def new_ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id)
  end

  def ticket_params
    params.require(:ticket).permit(:user_id, :train_id, :start_station_id, :end_station_id, :passenger_name, :passenger_passport)
  end
end