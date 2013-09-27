class AddToDateToLeaveRequests < ActiveRecord::Migration
  def change
  rename_column :leave_requests, :to_date, :todate
  end
end
