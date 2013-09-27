class EmployeesRoles < ActiveRecord::Base
  attr_accessible :createdby, :employee_id, :modifiedby, :role_id, :title

  belongs_to :employee
  belongs_to :role 

end
