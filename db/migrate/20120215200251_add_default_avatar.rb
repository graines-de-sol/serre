class AddDefaultAvatar < ActiveRecord::Migration
  def up
    rename_column :members, :avatar, :avatar_uid
    change_column_default :members, :avatar_uid, 'default_avatar/default_avatar.png'
  end

  def down
  end
end

