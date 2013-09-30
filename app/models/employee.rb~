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
end
