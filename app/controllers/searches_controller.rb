class SearchesController < ApplicationController
  def show
    @search = Search.new
  end

  def create
    @search = Search.do(search_params)
    render :show
  end

  private

  def search_params
    params.require(:search).permit(:start_station_id, :end_station_id)
  end
end