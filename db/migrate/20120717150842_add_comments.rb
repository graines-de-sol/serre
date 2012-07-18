class AddComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.timestamps

      t.text :content
      t.integer :post_id
      t.integer :member_id
    end
  end

  def self.down
    drop_table :comments
  end
end

