class AddPosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.timestamps

      t.text :title
      t.text :content
      t.integer :post_category_id
    end
  end

  def self.down
    drop_table :posts
  end
end

