class AddImagesTable < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.datetime  "created_at"
      t.string  "image_uid"
    end
  end

  def down
    drop_table :images
  end
end

