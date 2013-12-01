class AddPostedAtToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :posted_at, :date
  end
end
