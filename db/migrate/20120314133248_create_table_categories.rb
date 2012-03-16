class CreateTableCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string   "name"
    end
  end

  def down
    drop_table :name
  end
end

