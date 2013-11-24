class ChangeGalleries < ActiveRecord::Migration
  def up
    rename_table :galleries, :pictures
  end

  def down
  end
end
