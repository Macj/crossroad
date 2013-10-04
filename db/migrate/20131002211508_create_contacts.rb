class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :people_id
      t.string :type
      t.string :data

      t.timestamps
    end
  end
end
