class ChangePositionToAddress < ActiveRecord::Migration
  def change
    rename_column :places, :place_id, :address_id
  end
end
