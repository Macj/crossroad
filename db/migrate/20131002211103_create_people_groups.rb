class CreatePeopleGroups < ActiveRecord::Migration
  def change
    create_table :people_groups do |t|
      t.text :people_with_contacts
      t.string :people_ids
      t.string :name

      t.timestamps
    end
  end
end
