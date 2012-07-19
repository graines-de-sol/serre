class RenameBlogCategory < ActiveRecord::Migration
  def up
    rename_column :posts, :post_category_id, :blog_category_id
  end

  def down
  end
end

