class AddBlogCategories < ActiveRecord::Migration
  def self.up
    create_table :blog_categories do |t|
      t.timestamps

      t.text :name

    end
  end

  def self.down
    drop_table :blog_categories
  end
end

