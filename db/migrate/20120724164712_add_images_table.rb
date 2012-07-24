class AddImagesTable < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.timestamps

      t.text :image

    end
  end

  def self.down
    drop_table :galleries
  end
end

