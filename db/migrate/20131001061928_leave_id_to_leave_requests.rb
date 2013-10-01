class LeaveIdToLeaveRequests < ActiveRecord::Migration

 def change
  
    change_column :leave_requests, :employee_id, :integer
   
  end



end
