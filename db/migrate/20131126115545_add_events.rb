class AddEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.timestamps

      t.text :title
      t.datetime :start_at
      t.datetime :end_at
      t.string :event_id
    end
  end

  def down
  end
end
