class AddColumnsForMembers < ActiveRecord::Migration
  def up
    add_column :members, :organisation, :string
    add_column :members, :website, :string
    add_column :members, :baseline, :string
  end

  def down
    remove_column :members, :organisation
    remove_column :members, :website
    remove_column :members, :baseline
  end
end

