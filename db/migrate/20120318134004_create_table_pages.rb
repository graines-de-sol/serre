class CreateTablePages < ActiveRecord::Migration

  def up
    create_table :pages do |t|
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
  end

  def down
    drop_table :pages
  end

end

