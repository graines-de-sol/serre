class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.timestamps

      t.text :title
      t.text :content
      t.datetime :sent_on
    end
  end

  def self.down
    drop_table :newsletters
  end
end

