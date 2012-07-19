class AddFlashMessage < ActiveRecord::Migration
  def self.up
    add_column :confs, :headline, :text
    add_column :confs, :headline_published, :boolean, :default => true
  end

  def self.down
    remove_column :confs, :headline
    remove_column :confs, :headline_published
  end
end

