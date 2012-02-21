class AddStatusIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :status_id, :integer
    add_index :members, :status_id
  end
end

