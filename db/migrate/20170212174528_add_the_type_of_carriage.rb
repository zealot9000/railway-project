class AddTheTypeOfCarriage < ActiveRecord::Migration
  def change
    add_column :carriages, :type, :string
    rename_column :carriages, :low_seats, :bottom_seats
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :sitting_seats, :integer
  end
end
