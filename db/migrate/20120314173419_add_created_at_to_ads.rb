class AddCreatedAtToAds < ActiveRecord::Migration
  def change
    add_column :ads, :created_at, :date
  end
end

