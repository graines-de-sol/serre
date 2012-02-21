class AddTableNetworks < ActiveRecord::Migration
  def up
    create_table :networks do |t|
      t.string   "name"
      t.string   "icon"
      t.boolean  "is_pro"
    end
  end

  def down
    drop_table :networks
  end
end

