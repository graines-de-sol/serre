class CreateTableMedias < ActiveRecord::Migration
  def self.up
    create_table :medias do |t|
      t.timestamps

      t.string  :name
      t.string  :filename
      t.text    :description
      t.string  :mime_type
      t.string  :locator
      t.integer :filesize
      t.integer :media_category_id
    end
  end

  def self.down
    drop_table :medias
  end
end

