class CreateTableLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.string   "name"
      t.string   "address"
      t.string   "city"
      t.string   "zip"
    end
  end

  def down
    drop_table :locations
  end
end

