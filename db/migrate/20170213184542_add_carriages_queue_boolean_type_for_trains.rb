class AddCarriagesQueueBooleanTypeForTrains < ActiveRecord::Migration
  def change
    add_column :trains, :queue, :boolean, default: true
  end
end
