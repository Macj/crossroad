class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.integer :category_id
      t.integer :autor_id
      t.text :body
      t.text :sources

      t.timestamps
    end
  end
end
