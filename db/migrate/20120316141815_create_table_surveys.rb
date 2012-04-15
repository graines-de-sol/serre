class CreateTableSurveys < ActiveRecord::Migration
  def up
    create_table :surveys do |t|
      t.date     "created_at"
      t.string   "question"
      t.integer  "answers"
      t.integer  "parent_id"
      t.integer  "location.id"
    end
  end

  def down
    drop_table :surveys
  end
end

