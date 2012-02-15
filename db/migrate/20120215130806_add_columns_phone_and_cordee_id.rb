class AddColumnsPhoneAndCordeeId < ActiveRecord::Migration
  def up
    add_column :members, :phone, :string
    add_column :members, :location_id, :integer
  end

  def down
    remove_column :members, :phone
    remove_column :members, :location_id
  end
end

