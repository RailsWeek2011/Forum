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

ActiveRecord::Schema.define(:version => 20110725100846) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["category_id"], :name => "index_categories_on_category_id"

  create_table "freds", :force => true do |t|
    t.string   "headline"
    t.string   "content"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "freds", ["category_id"], :name => "index_freds_on_category_id"
  add_index "freds", ["user_id"], :name => "index_freds_on_user_id"

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.integer  "post_id"
    t.integer  "fred_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["fred_id"], :name => "index_posts_on_fred_id"
  add_index "posts", ["post_id"], :name => "index_posts_on_post_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nick"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
