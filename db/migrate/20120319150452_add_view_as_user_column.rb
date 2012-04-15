class AddViewAsUserColumn < ActiveRecord::Migration
  def up
    add_column :users, :view_as_user, :boolean
  end

  def down
    remove_column :users, :view_as_user
  end
end

