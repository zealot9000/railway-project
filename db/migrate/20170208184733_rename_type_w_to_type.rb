class RenameTypeWToType < ActiveRecord::Migration
  def change
    rename_column :carriages, :type_w, :type_of_carriage
  end
end
