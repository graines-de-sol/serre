class AddCalendars < ActiveRecord::Migration
  def self.up
    create_table :calendars do |t|
      t.timestamps

      t.string  :name
      t.text    :description
      t.string  :email
      t.string  :rss
    end
  end

  def self.down
    drop_table :calendars
  end
end

