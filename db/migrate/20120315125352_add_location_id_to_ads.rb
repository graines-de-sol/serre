class AddLocationIdToAds < ActiveRecord::Migration
  def change
    add_column :ads, :location_id, :integer
  end
end

