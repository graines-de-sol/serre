class ChangeToIsPublished < ActiveRecord::Migration
  def up
    rename_column :posts, :published, :is_published
  end

  def down
  end
end
