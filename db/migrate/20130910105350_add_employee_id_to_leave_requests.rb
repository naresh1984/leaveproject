class AddEmployeeIdToLeaveRequests < ActiveRecord::Migration
  def up

    add_column :leave_requests, :employee_id, :integer 
    add_column :leave_requests, :fromdate, :date
    add_column :leave_requests, :to_date, :date
    add_column :leave_requests, :numdays, :integer
    add_column :leave_requests, :resumeon, :date
    add_column :leave_requests, :reason, :string
    add_column :leave_requests, :contactno, :string
    add_column :leave_requests, :address, :text
    add_column :leave_requests, :currentproject, :string
    add_column :leave_requests, :managerid, :integer
    add_column :leave_requests, :remarks, :string 
    add_column :leave_requests, :createdby, :integer
    add_column :leave_requests, :modifiedby, :integer
    add_column :leave_requests, :status, :string

  end

  def down

    remove_column :leave_requests, :employee_id, :integer
    remove_column :leave_requests, :fromdate, :date
    remove_column :leave_requests, :to_date, :date
    remove_column :leave_requests, :numdays, :integer
    remove_column :leave_requests, :resumeon, :date
    remove_column :leave_requests, :reason, :string
    remove_column :leave_requests, :contactno, :string
    remove_column :leave_requests, :address, :text
    remove_column :leave_requests, :currentproject, :string
    remove_column :leave_requests, :managerid, :integer
    remove_column :leave_requests, :remarks, :string 
    remove_column :leave_requests, :createdby, :integer
    remove_column :leave_requests, :modifiedby, :integer
    remove_column :leave_requests, :status, :string
  end
end
