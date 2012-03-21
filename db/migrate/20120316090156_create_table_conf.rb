class CreateTableConf < ActiveRecord::Migration
  def up
    create_table :confs do |t|
      t.date     "created_at"
      t.string   "default_avatar_uid"
      t.string   "default_location_id"
      t.string   "max_surveys"
    end
  end

  def down
    drop_table :confs
  end
end

