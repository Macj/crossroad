# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131005194046) do

  create_table "addresses", :force => true do |t|
    t.string   "city"
    t.string   "street"
    t.string   "building"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "autor_id"
    t.text     "body"
    t.text     "sources"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "autor"
    t.integer  "type_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "people_id"
    t.string   "type"
    t.string   "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "category_id"
    t.integer  "type_id"
    t.integer  "place_id"
    t.integer  "galery_id"
    t.string   "name"
    t.date     "begin_date"
    t.date     "end_date"
    t.text     "description"
    t.text     "web_links"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "fio"
    t.string   "role"
    t.text     "info"
    t.text     "activity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people_groups", :force => true do |t|
    t.text     "people_with_contacts"
    t.string   "people_ids"
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "type_id"
    t.integer  "place_id"
    t.integer  "galery_id"
    t.text     "description"
    t.text     "web_links"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "positions", :force => true do |t|
    t.integer  "address_id"
    t.string   "y_coordinate"
    t.string   "x_coordinate"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "type_id"
    t.integer  "org_group_id"
    t.integer  "galery_id"
    t.text     "description"
    t.text     "web_links"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
