class LeaveIdToLeaveRequests < ActiveRecord::Migration
  def up
 change_column :leave_requests, :employee_id, :integer
  end

  def down
  end
end
