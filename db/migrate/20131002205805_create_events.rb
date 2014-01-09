class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :category_id
      t.integer :type_id
      t.integer :place_id
      t.integer :galery_id
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.text :description
      t.text :web_links
      
      t.timestamps
    end
  end
end
