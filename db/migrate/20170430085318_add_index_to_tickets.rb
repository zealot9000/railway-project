class AddIndexToTickets < ActiveRecord::Migration
  def change
    add_index :tickets, :train_id
    add_index :tickets, :user_id
    add_index :tickets, :start_station_id
    add_index :tickets, :end_station_id
  end
end
