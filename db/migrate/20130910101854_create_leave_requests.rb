class CreateLeaveRequests < ActiveRecord::Migration
  def change
    create_table :leave_requests do |t|

      t.timestamps
    end
  end
end
