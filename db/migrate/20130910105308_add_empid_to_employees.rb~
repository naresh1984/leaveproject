class AddEmpidToEmployees < ActiveRecord::Migration

 def up

    add_column :employees, :empid, :string 
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :email, :string
    add_column :employees, :password_digest, :string
    add_column :employees, :manager_id, :string
    add_column :employees, :contact_no, :string
    add_column :employees, :address, :text
    add_column :employees, :createdby, :integer
    add_column :employees, :modifiedby, :integer  

  end

  def down

    remove_column :employees, :empid, :string 
    remove_column :employees, :first_name, :string
    remove_column :employees, :last_name, :string
    remove_column :employees, :email, :string
    remove_column :employees, :password_digest, :string
    remove_column :employees, :manager_id, :string
    remove_column :employees, :contact_no, :string
    remove_column :employees, :address, :text
    remove_column :employees, :createdby, :integer
    remove_column :employees, :modifiedby, :integer
  end

  


end
