class AddMemberIdToAds < ActiveRecord::Migration
  def change
    add_column :ads, :member_id, :integer
  end
end

