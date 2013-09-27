class AddLeavesFloatToLeaves < ActiveRecord::Migration
  def change
  
    change_column :leaves, :employee_id, :integer
    change_column :leaves, :els, :float
    change_column :leaves, :nels, :float
    change_column :leaves, :lops, :float
    change_column :leaves, :compoffs, :float
    change_column :leaves, :is_special, :float
    change_column :leaves, :createdby, :integer
    change_column :leaves, :modifiedby, :integer


  
  end
end
