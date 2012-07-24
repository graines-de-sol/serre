class AddPublishedToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :published_at, :datetime
  end

  def self.down
    #
  end
end

