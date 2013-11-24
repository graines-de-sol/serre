class Galleries < ActiveRecord::Migration
  def up
    create_table :galleries do |t|
      t.timestamps
      t.string :name
      t.date :event_at
      t.text :comment

      t.text :name

    end
  end

  def down
  end
end
