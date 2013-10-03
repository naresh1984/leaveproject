class Admin::EmployeesController < AdminController
require 'csv'
include ActionView::Helpers::NumberHelper

def index
   
   @search=" employee_id >0 "
   if session[:roles].include?(4) == false
   @search+=" AND employees.location_id = '#{session[:location_id]}'"
   end 
   if params[:empid].present?
      @search+=" AND empid LIKE '%#{params[:empid]}%'"
    end
   
    if params[:first_name].present?
      @search+=" AND (first_name LIKE '%#{params[:first_name]}%' OR  last_name LIKE '%#{params[:first_name]}%')"
    end
    
    @employees = Leafe.joins(:employee).where(@search).paginate(:page => params[:page],:per_page => 10).order("employees.empid ASC")


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
      
    end
  end
# GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
  end


  # GET /employees/new
  # GET /employees/new.json
  def new

   @employee = Employee.new
   @heading="Add Employee"   
   if session[:roles].include?(4)
    @locations = Admin::Location.all
    @roles = Role.all
   else
     @locations = Admin::Location.where("id= ?", session[:location_id])
     @roles = Role.where("id!=4")
   end
  
   #raise @locations.inspect
   @manager_list=Employee.joins(:employee_roles).where('employees_roles.role_id=3').order('first_name ASC');
   @role_user_ids =EmployeesRoles.where(:employee_id=>params[:id]).select("role_id")
   @condition={} 

   respond_to do |format|
      format.html # manager.html.erb
      format.json { render json: @employee }
    end

  end

  # GET /employees/1/edit
  def edit
  @employee= Employee.find(params[:id])
  @heading="Edit Employee Details"
   if session[:roles].include?(4)
    @locations = Admin::Location.all
    @roles = Role.all
   else
     @locations = Admin::Location.where("id= ?", session[:location_id])
     @roles = Role.where("id!=4")
   end
  @manager_list=Employee.joins(:employee_roles).where('employees_roles.role_id=3').order('first_name ASC');
  @conditions =EmployeesRoles.where(:employee_id=>params[:id]).select("role_id")
  @condition={}   
  @conditions.each do |role|  
  @condition[role.role_id] = role.role_id  
  end
  end

  # POST /employees
  # POST /employees.json
  def create
 @employee = Employee.new(params[:employee])
 @roles= Role.all
 @locations = Admin::Location.all
 @manager_list=Employee.joins(:employee_roles).where('employees_roles.role_id=3');
 @employee.location_id= params[:location_id]
 @employee.manager_id= params[:manager_id]
 @conditions =EmployeesRoles.where(:employee_id=>params[:id]).select("role_id")
 @condition={}   
 @conditions.each do |role|  
 @condition[role.role_id] = role.role_id
 end 

    respond_to do |format|
      if @employee.save
        Leafe.create(:employee_id => @employee.id)
        params[:roles_ids].each do |role_id|
        EmployeesRoles.create(:role_id => role_id, :employee_id => @employee.id, :createdby =>session[:user_id], :modifiedby=>session[:user_id])
        end   
        UserMailer.registration_email(@employee,'Login details',@employee.email).deliver       
        format.html { redirect_to admin_employees_path, notice: 'Employee was successfully created.' }
        format.json { render json: admin_employees_path, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: admin_employee_path.errors, status: :unprocessable_entity }
      end
    end
  
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
  @employee = Employee.find(params[:id])
  @employee.location_id= params[:location_id]
  @employee.manager_id= params[:manager_id]
  @roles= Role.all
  @locations = Admin::Location.all
  @manager_list=Employee.joins(:employee_roles).where('employees_roles.role_id=3');
    respond_to do |format|
      if @employee.update_attributes(params[:employee])      
    EmployeesRoles.delete_all(:employee_id =>@employee.id)
  params[:roles_ids].each do |role_id|
        EmployeesRoles.create(:role_id => role_id, :employee_id => @employee.id, :createdby =>session[:user_id], :modifiedby=>session[:user_id])
        end

        format.html { redirect_to edit_admin_employee_path(params[:id]), notice: 'Employee details saved successfully' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  
  end

  # DELETE /employees/1
  # DELETE /employees/1.json


  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to admin_employees_path

  
  end

def export_to_csv       
    @users = Employee.find(:all) 
    csv_string = CSV.generate(:col_sep => " ") do |csv|        
         csv << ["Empid", "First Name", "Last name","Contact No",'Address',"Email",'ELs','NELs','CompOffs','LOPs']
         @users.each do |user|
           csv << [user.empid, user.first_name, user.last_name,user.contact_no,user.address,user.email,number_to_human(user.leafe.els),number_to_human(user.leafe.nels),number_to_human(user.leafe.compoffs),number_to_human(user.leafe.lops)]
         end
    end     
    
  time = Time.new
   send_data csv_string,:type => 'text/csv; charset=iso-8859-1; header=present',:disposition => "attachment; filename=employee#{time.strftime("%m-%d-%Y %I:%M:%S %p")}.csv" 
end 





end
