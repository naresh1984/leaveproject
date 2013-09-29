# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


["admin", "employee", "manager", "super manger"].each do |r|
  Role.create(title: r)
end

employee = Employee.create!(email: 'test01@gmail.com', empid: "001", password: "123456", :password_confirmation => "123456", first_name: 'test', last_name: "001")

Role.all.each do |role|
  EmployeesRoles.create(employee_id: employee.id, role_id: role.id)
end