class AddPhotosToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :workgroup_category_id, :integer
  end
end
