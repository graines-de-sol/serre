class AddIsPublicToWorkgroups < ActiveRecord::Migration
  def change
    add_column :workgroup_categories, :is_public, :boolean, :default => false
  end
end
