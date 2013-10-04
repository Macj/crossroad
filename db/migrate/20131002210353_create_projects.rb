class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :category_id
      t.integer :type_id
      t.integer :org_group_id
      t.integer :galery_id
      t.text :description
      t.text :web_links

      t.timestamps
    end
  end
end
