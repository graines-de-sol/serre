class AddEnteredAtToMembers < ActiveRecord::Migration
  def change
    add_column :members, :entered_at, :date
  end
end
