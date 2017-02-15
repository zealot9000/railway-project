class ChangeSeatsDefaultValue < ActiveRecord::Migration
  def change
    change_column_default :carriages, :side_bottom_seats, 0
    change_column_default :carriages, :side_top_seats, 0
    change_column_default :carriages, :sitting_seats, 0
  end
end
