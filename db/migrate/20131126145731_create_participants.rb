class CreateParticipants < ActiveRecord::Migration
  def up
    create_table :participants do |t|
      t.timestamps

      t.integer :member_id
      t.integer :event_id
    end
  end

  def down
  end
end
