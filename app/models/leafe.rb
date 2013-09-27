class Leafe < ActiveRecord::Base
  attr_accessible :compoffs, :createdby, :els, :employee_id, :is_special, :lops, :modifiedby, :nels ,:leafe_attributes

belongs_to:employee
end
