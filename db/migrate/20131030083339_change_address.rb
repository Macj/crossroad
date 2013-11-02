class ChangeAddress < ActiveRecord::Migration
  def up
   add_column :addresses, :y_coordinate, :string 
   add_column :addresses, :x_coordinate, :string
   drop_table :positions
  end

  def down
    create_table :positions do |t|
      t.integer :address_id
      t.string :y_coordinate
      t.string :x_coordinate

      t.timestamps
    end
    remove_column :addresses, :y_coordinate, :string 
    remove_column :addresses, :x_coordinate, :string
  end
end
