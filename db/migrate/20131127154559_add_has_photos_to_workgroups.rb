class AddHasPhotosToWorkgroups < ActiveRecord::Migration
  def change
    add_column :workgroup_categories, :has_photos, :boolean, :default => false
  end
end
