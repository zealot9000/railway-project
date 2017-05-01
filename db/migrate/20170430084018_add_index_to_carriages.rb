class AddIndexToCarriages < ActiveRecord::Migration
  def change
    add_index :carriages, [:id, :type]
  end
end
