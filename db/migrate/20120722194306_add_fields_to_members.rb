class AddFieldsToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :organisation_2, :text
    add_column :members, :website_2, :text
    add_column :members, :mobile, :text
    add_column :members, :www_published, :boolean, :default => true
    add_column :members, :is_active, :boolean, :default => true
  end

  def self.down
    #
  end
end

