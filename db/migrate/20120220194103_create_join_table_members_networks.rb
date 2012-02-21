class CreateJoinTableMembersNetworks < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.integer "member_id"
      t.integer "network_id"
      t.string  "url"
    end

    add_index :profiles, :member_id
    add_index :profiles, :network_id
  end

  def down
    drop_table :profiles
  end
end

