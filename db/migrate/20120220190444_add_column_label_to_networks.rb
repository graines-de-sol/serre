class AddColumnLabelToNetworks < ActiveRecord::Migration
  def change
    add_column :networks, :label, :string
  end
end

