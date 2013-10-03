class SessionsController < ApplicationController

  skip_before_filter :authorize , :only => [:new,:create]

  @page_title='Olm | Login'
  def new
    if session[:user_id].present?
      redirect_to leave_requests_path
    end

  end

  def create

     @user = Employee.find_by_email(params[:email])
    
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:admin_id] = @user.id
      session[:user_name] = @user.email
      session[:user_empid] = @user.empid
      session[:first_name] = @user.first_name
      session[:last_name] = @user.last_name
      session[:location_id] = @user.location_id
      @conditions =EmployeesRoles.where(:employee_id=>@user.id).select("role_id")
      @condition={}   
      @conditions.each do |role|  
      @condition[role.role_id] = role.role_id  
      end
      session[:roles]=@condition

      redirect_to leave_requests_url

    else
 #raise @user.inspect
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end
  



  def change_password
  @page_title="Chnage Password"

  end

  def change_update
  @page_title="Chnage Password"
    @user =Employee.find(session[:user_id])

    if params[:password_old]== '' || params[:password]== '' || params[:password_confirmation]== ''

      redirect_to change_password_url, alert:'Please fill all fields'

    elsif  params[:password]!= params[:password_confirmation]

     redirect_to change_password_url, alert:"Password doesn't match confirmation"

    elsif @user and @user.authenticate(params[:password_old]) and @user.update_attributes(:password => params[:password])

     redirect_to change_password_url, alert: "Password successfully updated"

    else

        redirect_to change_password_url, alert: 'Invalid old password'

    end


  end


  def destroy

    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out"
  end



end
