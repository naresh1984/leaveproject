# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


["Admin", "Employee", "Manager", "Super Manger"].each do |r|
  Role.create(title: r)
end
["Hyderabad", "Banglore", "USA"].each do |l|
Admin::Location.create!(title: l)
end
employee = Employee.create!(email: 'naresh.nookal@gmail.com', empid: "Lt/154", password: "naresh", :password_confirmation => "naresh", first_name: 'naresh babu', last_name: "nookala" ,address: 'N.Naresh babu Nookala,
Seetarampet village,
Pullampet (MD),
Kadapa(DT),
Andhrapradesh' ,contact_no:'9490644170' ,manager_id:'1' ,location_id:'1')

leafe = Leafe.create(employee_id: employee.id)

Role.all.each do |role|
  EmployeesRoles.create(employee_id: employee.id, role_id: role.id)
end
