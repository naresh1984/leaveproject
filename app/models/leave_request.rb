class LeaveRequest < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :address, :contactno, :createdby, :currentproject, :employee_id, :fromdate, :managerid, :modifiedby, :numdays, :reason, :remarks, :resumeon, :todate
                :leafe_attributes

 belongs_to :employee
 has_many :processed_leave , :class_name => "ProcessedLeave"

def self.els_count
    sum(:els)
  end

  def self.nels_count
    sum(:nels)
  end

  def self.lops_count
    sum(:lops)
  end

  def self.compoffs_count
    sum(:compoffs)
  end



end
