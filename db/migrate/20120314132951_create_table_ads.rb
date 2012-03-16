class CreateTableAds < ActiveRecord::Migration
  def up
    create_table :ads do |t|
      t.string   "subject"
      t.text     "body"
      t.date     "end_at"
      t.integer  "category_id"
    end
  end

  def down
    drop_table :ads
  end
end

