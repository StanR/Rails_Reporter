# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120315191228) do

  create_table "journals", :force => true do |t|
    t.string   "work"
    t.text     "activity"
    t.date     "date"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "journals", ["project_id"], :name => "index_journals_on_project_id"
  add_index "journals", ["user_id"], :name => "index_journals_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "platform"
    t.text     "tools"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "name"
    t.string   "email"
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
