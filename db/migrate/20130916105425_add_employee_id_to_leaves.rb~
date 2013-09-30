class AddEmployeeIdToLeaves < ActiveRecord::Migration
  def up
    #create_table :leaves
    add_column :leaves, :employee_id, :integer
    add_column :leaves, :els, :decimal , :default => 0
    add_column :leaves, :nels, :decimal , :default => 0
    add_column :leaves, :lops, :decimal , :default => 0
    add_column :leaves, :compoffs, :decimal , :default => 0
    add_column :leaves, :is_special, :decimal , :default => 0
    add_column :leaves, :createdby, :integer
    add_column :leaves, :modifiedby, :integer
  end
  def down
     drop_table :leaves
  end


end
