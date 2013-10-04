class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :fio
      t.string :role
      t.text :info
      t.text :activity

      t.timestamps
    end
  end
end
