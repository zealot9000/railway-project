class AddPassengerAndPassportToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :passenger_name, :string
    add_column :tickets, :passenger_passport, :string
  end
end
