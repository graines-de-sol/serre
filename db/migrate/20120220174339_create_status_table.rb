class CreateStatusTable < ActiveRecord::Migration
  def up
    create_table :status do |t|
      t.string   "name"
    end
  end

  def down
    drop_table :status
  end
end

