class Employee < ActiveRecord::Base
  attr_accessible :address, :contact_no, :created_by, :email, :first_name, :last_name, :manager_id, :modified_by, :empid, :password_digest, :password, :location_id, :password_confirmation
                :leafe_attributes
  validates :email, presence: true, uniqueness: true
  validates :empid, presence: true, uniqueness: true

  has_secure_password

  has_many :leave_requests , :dependent => :destroy
  has_many :employee_roles, :class_name => "EmployeesRoles"  ,:dependent => :destroy 
  has_and_belongs_to_many :roles 
  has_one :leafe  , :dependent => :destroy
  
  accepts_nested_attributes_for :leafe 

def self.monthlyupdates       
  	
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


def as_xls(options = {})
  {
      "Empid" => empid,
      "Name" => first_name+" "+last_name,
      "E-Mail" => email,
      "Address" => address,
      "Contact NO" => contact_no,
      "ELs" => els,
      "NELs" => nels,
      "LOPs" => lops,
      "COMPOFFs" => compoffs,
	     
    
  }
end



end
