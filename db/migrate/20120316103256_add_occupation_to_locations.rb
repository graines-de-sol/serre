class AddOccupationToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :occupation, :integer
  end
end

