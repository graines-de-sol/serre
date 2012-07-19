class AddMediaCategories < ActiveRecord::Migration
  def self.up
    create_table :media_categories do |t|
      t.timestamps

      t.text :name
      t.text :description
      t.boolean :published, :default => true
    end
  end

  def self.down
    drop_table :media_categories
  end
end

