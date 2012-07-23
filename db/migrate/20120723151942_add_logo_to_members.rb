class AddLogoToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :logo_uid, :string
  end

end

