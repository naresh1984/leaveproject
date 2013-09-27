class CreateEmployeesRoles < ActiveRecord::Migration
  def change
    create_table :employees_roles do |t|
      t.integer :employee_id
      t.integer :role_id
      t.integer :createdby
      t.string :modifiedby
      t.string :title

      t.timestamps
    end
  end
end
