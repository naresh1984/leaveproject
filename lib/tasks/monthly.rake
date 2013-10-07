namespace :monthly do
  desc "TODO"
  task :create => :environment do
 
        @leave=Leafe.all        
        @leave.each do |leafe| 
        @l=Leafe.find(leafe.id)
      
           @leaves_audit_logs = LeavesAuditLog.new
           @leaves_audit_logs.preels=leafe.els
	   @leaves_audit_logs.prenels=leafe.nels
	   @leaves_audit_logs.prelops=leafe.lops
	   @leaves_audit_logs.precompoffs=leafe.compoffs
	   @leaves_audit_logs.employee_id=leafe.employee_id
           @l.els=leafe.els+1
           @l.nels=leafe.nels+1
	   @leaves_audit_logs.currentels=@l.els
	   @leaves_audit_logs.currentnels=@l.nels
	   @leaves_audit_logs.currentlops=@l.lops
	   @leaves_audit_logs.currentcompoffs=@l.compoffs	  
	   @leaves_audit_logs.tableorscreen='cronjob generalLeave'
           @leaves_audit_logs.save
	   @l.update_attributes(:id =>leafe.id)

    end 

  end


end
