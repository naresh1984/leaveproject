class LeaveRequest < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :address, :contactno, :createdby, :currentproject, :employee_id, :fromdate, :managerid, :modifiedby, :numdays, :reason, :remarks, :resumeon, :todate
                :leafe_attributes

 belongs_to :employee
 has_many :processed_leave , :class_name => "ProcessedLeave"


end
