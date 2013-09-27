class AddEmployeeIdToLeaves < ActiveRecord::Migration
  def up
    #create_table :leaves
    add_column :leaves, :employee_id, :integer
    add_column :leaves, :els, :decimal
    add_column :leaves, :nels, :decimal
    add_column :leaves, :lops, :decimal
    add_column :leaves, :compoffs, :decimal
    add_column :leaves, :is_special, :decimal
    add_column :leaves, :createdby, :integer
    add_column :leaves, :modifiedby, :integer
  end
  def down
     drop_table :leaves
  end


end
