class AddCommentsToWorkgroups < ActiveRecord::Migration
  def change
    add_column :comments, :workgroup_category_id, :integer
  end
end
