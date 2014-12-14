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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141205184518) do

  create_table "git_hub_infos", force: true do |t|
    t.date     "last_update"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "git_hub_repos", force: true do |t|
    t.string   "name"
    t.integer  "num_commits"
    t.datetime     "last_commit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.string "name"
    t.string "url"
  end

  create_table "programming_languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repo_languages", force: true do |t|
    t.integer  "git_hub_repo_id"
    t.integer  "programming_language_id"
    t.integer  "number_lines"
    t.integer  "other_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
