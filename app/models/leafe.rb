class Leafe < ActiveRecord::Base
  attr_accessible :compoffs, :createdby, :els, :employee_id, :is_special, :lops, :modifiedby, :nels ,:leafe_attributes

belongs_to:employee

def self.monthlyupdates
      @leafe=Leafe.find(:all)

	@leafe.each do |employee|

	@leafe.els=10
	@leafe.nels=10

	@leafe.update_attributes(employee.employee_id)

	end 

end



end
