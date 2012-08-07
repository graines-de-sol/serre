class AddDefaultNewsletterHeader < ActiveRecord::Migration
  def self.up
    add_column :confs, :newsletter_header_uid, :text
  end

  def self.down
    remove_column :confs, :newsletter_header_uid
  end
end

