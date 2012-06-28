class InitialMigration < ActiveRecord::Migration
  def self.up
    create_table "ads" do |t|
      t.string   "subject"
      t.text     "body"
      t.date     "end_at"
      t.integer  "category_id"
      t.integer  "member_id"
      t.datetime "created_at"
      t.integer  "location_id"
    end

    create_table "articles" do |t|
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

    create_table "categories" do |t|
      t.string "name"
    end

    create_table "confs" do |t|
      t.date    "created_at"
      t.string  "default_avatar_uid"
      t.integer "default_location_id",   :default => 1
      t.integer "max_surveys",   :default => 5
      t.string  "welcome_mail_subject", :default => ""
      t.text    "welcome_mail_body"
    end

    create_table "images" do |t|
      t.datetime "created_at", :null => false
      t.string   "image_uid"
    end

    create_table "locations" do |t|
      t.string   "name"
      t.string   "address"
      t.string   "city"
      t.string   "zip"
      t.integer  "occupation", :default => 0
      t.datetime "updated_at",                :null => false
    end

    create_table "members" do |t|
      t.integer "user_id"
      t.string  "first_name",   :default => "anonyme"
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
    end

    add_index "members", ["status_id"], :name => "index_members_on_status_id"

    create_table "networks" do |t|
      t.string  "name"
      t.string  "icon"
      t.boolean "is_pro"
      t.string  "label"
    end

    create_table "profiles" do |t|
      t.integer "member_id"
      t.integer "network_id"
      t.string  "url"
    end

    add_index "profiles", ["member_id"], :name => "index_profiles_on_member_id"
    add_index "profiles", ["network_id"], :name => "index_profiles_on_network_id"

    create_table "status" do |t|
      t.string "name"
    end

    create_table "surveys" do |t|
      t.string   "question"
      t.integer  "score",       :default => 0, :null => false
      t.integer  "parent_id"
      t.integer  "location_id"
      t.datetime "created_at"
      t.text     "voters",                     :null => false
    end

    create_table "users" do |t|
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

  def self.down
    drop_table "ads"
    drop_table "articles"
    drop_table "categories"
    drop_table "confs"
    drop_table "images"
    drop_table "locations"
    drop_table "members"
    drop_table "networks"
    drop_table "profiles"
    drop_table "status"
    drop_table "surveys"
    drop_table "users"
  end
end

