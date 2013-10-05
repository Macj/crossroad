class AddAutorToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :autor, :string
  end
end
