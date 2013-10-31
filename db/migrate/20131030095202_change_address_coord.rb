class ChangeAddressCoord < ActiveRecord::Migration
  def up
    rename_column :addresses, :y_coordinate, :lng
    rename_column :addresses, :x_coordinate, :lat
  end

  def down
  end
end
