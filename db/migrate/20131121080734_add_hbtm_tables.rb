class AddHbtmTables < ActiveRecord::Migration
  def change
    create_table :articles_places do |t|
      t.belongs_to :article
      t.belongs_to :place
    end

    create_table :articles_events do |t|
      t.belongs_to :article
      t.belongs_to :event
    end

    create_table :articles_people do |t|
      t.belongs_to :article
      t.belongs_to :person
    end

    create_table :articles_projects do |t|
      t.belongs_to :article
      t.belongs_to :project
    end

  end
end
