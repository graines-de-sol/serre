class AddMembersTable < ActiveRecord::Migration
  def up
    create_table :members do |t|
      t.integer  "user_id"
      t.string   "first_name", :default=>'anonyme'
      t.string   "last_name"
      t.date     "birthday"
      t.string   "city"
      t.string   "avatar"
      t.text     "situation"
      t.text     "prestations"
      t.text     "references"
      t.text     "hobbies"
      t.text     "powers"
      t.text     "presence"
    end
  end

  def down
    drop_table :members
  end
end

