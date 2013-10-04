class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :address_id
      t.string :y_coordinate
      t.string :x_coordinate

      t.timestamps
    end
  end
end
