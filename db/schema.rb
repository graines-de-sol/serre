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

ActiveRecord::Schema.define(:version => 20120724164712) do

  create_table "ads", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.date     "end_at"
    t.integer  "category_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.integer  "location_id"
  end

  create_table "articles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "position"
    t.string   "category"
    t.string   "title"
    t.text     "content"
    t.text     "calendar"
    t.text     "video"
  end

  create_table "blog_categories", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
  end

  create_table "calendars", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "email"
    t.string   "rss"
  end

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  create_table "comments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.integer  "post_id"
    t.integer  "member_id"
  end

  create_table "confs", :force => true do |t|
    t.date    "created_at"
    t.string  "default_avatar_uid"
    t.string  "default_location_id"
    t.string  "max_surveys"
    t.string  "welcome_mail_subject", :default => ""
    t.text    "welcome_mail_body"
    t.text    "headline"
    t.boolean "headline_published",   :default => true
  end

  create_table "galleries", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "image"
  end

  create_table "images", :force => true do |t|
    t.datetime "created_at", :null => false
    t.string   "image_uid"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.integer  "occupation", :default => 0
    t.datetime "updated_at",                :null => false
  end

  create_table "media_categories", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.text     "description"
    t.boolean  "published",   :default => true
  end

  create_table "medias", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "filename"
    t.text     "description"
    t.string   "mime_type"
    t.string   "locator"
    t.integer  "filesize"
    t.integer  "media_category_id"
  end

  create_table "members", :force => true do |t|
    t.integer "user_id"
    t.string  "first_name",     :default => "anonyme"
    t.string  "last_name"
    t.date    "birthday"
    t.string  "city"
    t.string  "avatar_uid"
    t.text    "situation"
    t.text    "prestations"
    t.text    "references"
    t.text    "hobbies"
    t.text    "powers"
    t.text    "presence"
    t.string  "phone"
    t.integer "location_id"
    t.integer "status_id"
    t.string  "organisation"
    t.string  "website"
    t.string  "baseline"
    t.text    "organisation_2"
    t.text    "website_2"
    t.text    "mobile"
    t.boolean "www_published",  :default => false
    t.boolean "is_active",      :default => true
    t.string  "logo_uid"
  end

  add_index "members", ["status_id"], :name => "index_members_on_status_id"

  create_table "networks", :force => true do |t|
    t.string  "name"
    t.string  "icon"
    t.boolean "is_pro"
    t.string  "label"
  end

  create_table "posts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "title"
    t.text     "content"
    t.integer  "blog_category_id"
    t.boolean  "published"
    t.datetime "published_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer "member_id"
    t.integer "network_id"
    t.string  "url"
  end

  add_index "profiles", ["member_id"], :name => "index_profiles_on_member_id"
  add_index "profiles", ["network_id"], :name => "index_profiles_on_network_id"

  create_table "status", :force => true do |t|
    t.string "name"
  end

  create_table "surveys", :force => true do |t|
    t.string   "question"
    t.integer  "score",       :default => 0, :null => false
    t.integer  "parent_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.text     "voters",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",     :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",     :null => false
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
    t.string   "role",                                  :default => "user"
    t.boolean  "view_as_user"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
