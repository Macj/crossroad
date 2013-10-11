class AddPictureToObjects < ActiveRecord::Migration
  def self.up
    add_attachment :articles, :picture
    add_attachment :events, :picture
    add_attachment :people, :picture
    add_attachment :people_groups, :picture
    add_attachment :places, :picture
    add_attachment :projects, :picture
    

  end

  def self.down
    remove_attachment :articles, :picture
    remove_attachment :events, :picture
    remove_attachment :people, :picture
    remove_attachment :people_groups, :picture
    remove_attachment :places, :picture
    remove_attachment :projects, :picture
  end
end
