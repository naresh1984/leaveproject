class LeaveRequestsController < ApplicationController
  # GET /leave_requests
  # GET /leave_requests.json

  before_filter :authorize

  def index
    if params[:status_search] == 'All'
    @status_search = " id >0  " 
   
    elsif params[:status_search].present? 
      @status_search ="status = '#{params[:status_search]}'"
    else
      @status_search = "status = 'Approved'"
    end


    @employees = Employee.find(session[:user_id])
    @leave_requests = @employees.leave_requests.where(@status_search).paginate(:page => params[:page],:per_page => 10).order("fromdate DESC")
 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leave_requests }
    end
  end


  # GET /leave_requests/1
  # GET /leave_requests/1.json
  #def show
  #  @leave_request = LeaveRequest.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
     # format.json { render json: @leave_request }
   # end
  #end

  # GET /leave_requests/new
  # GET /leave_requests/new.json
  def new
    @employees=Employee.find(session[:user_id]);
    @leave_request = LeaveRequest.new    
    @manager_list=Employee.joins(:employee_roles).where('employees_roles.role_id=3').order('first_name,last_name DESC');
    @employee_m=employee_module(session[:user_id]); 
    @options='';
    @manager_list.each do |manager| 
    @options+="[#{manager.id}, #{manager.first_name+'  '+manager.last_name}],"
   

 #raise @employe12.inspect
    end 
      


    if params[:contactno]=''
      @leave_request.contactno =@employees.contact_no;
    end
    if   params[:address] =''
      @leave_request.address =@employees.address;
    end


    respond_to do |format|
      format.html # manager.html.erb
      format.json { render json: @leave_request }
    end
  end

  # GET /leave_requests/1/edit
  def edit
    @employees = Employee.find(session[:user_id])
    @leave_request = @employees.leave_requests.find(params[:id])
    @manager_list=Employee.joins(:employee_roles).where('employees_roles.role_id=3').order('first_name,last_name DESC');
    @employee_m=employee_module(session[:user_id]); 
    @options='';
    @manager_list.each do |manager| 
    @options+="[#{manager.id}, #{manager.first_name+'  '+manager.last_name}],"  
    end
  end

  # POST /leave_requests
  # POST /leave_requests.json
  def create

    @leave_request = LeaveRequest.new(params[:leave_request])
    @leave_request.status = "Pending";
    @leave_request.managerid = params[:manager_id];
    @leave_request.remarks= ''

    respond_to do |format|
      if @leave_request.save

        @employees = Employee.find(session[:user_id])
        @manager = Employee.find(params[:manager_id])
        UserMailer.welcome_email(@manager,@leave_request,@employees,'Request For Leave',@manager.email).deliver

        format.html { redirect_to request_success_url, notice: 'Leave request  has been sent successfully to your reporting manager' }
        format.json { render json: @leave_request, status: :created, location: @leave_request }

      else
        format.html { render action: "new" }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leave_requests/1
  # PUT /leave_requests/1.json
  def update
    @leave_request = LeaveRequest.find(params[:id])
    @leave_request.remarks= ''
    respond_to do |format|
      if @leave_request.update_attributes(params[:leave_request])
        @employees = Employee.find(session[:user_id])
        @manager = Employee.find(params[:manager_id])
        UserMailer.welcome_email(@manager,@leave_request,@employees,'Request For Leave',@manager.email).deliver
        format.html { redirect_to request_update_url, notice: 'Leave request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_requests/1
  # DELETE /leave_requests/1.json
  def destroy
    @leave_request = LeaveRequest.find(params[:id])
    @leave_request.destroy

    respond_to do |format|
      format.html { redirect_to leave_requests_url }
      format.json { head :no_content }
    end
  end


  def request_success

  end

  def request_update

  end

  def employee_leaves



     @search_pending="status = 'Pending'"
     @search_aproved="status = 'Approved'"

     @search=""
     @search+=" ANd "
     @search+= "managerid = #{session[:user_id]}"

    if params[:empid].present?
      @search+=" AND empid LIKE '%#{params[:empid]}%'"
    end
    if params[:first_name].present?
      @search+=" AND first_name LIKE '%#{params[:first_name]}%'"
    end

     if params[:fromdate].present?  and  params[:todate]==''
       @search+=" AND fromdate >= '#{Date.parse(params[:fromdate])}'"
     end

     if params[:fromdate]==''  and  params[:todate].present?
       @search+=" AND todate >= '#{Date.parse(params[:todate])}'"
     end

     if params[:fromdate].present? and    params[:todate].present?
       @search+=" AND ((fromdate BETWEEN '#{Date.parse(params[:fromdate])}' AND '#{Date.parse(params[:todate])}') OR (todate BETWEEN '#{Date.parse(params[:fromdate])}' AND '#{Date.parse(params[:todate])}'))"
     end

     @search_aproved+=" AND fromdate >= '#{Time.now.to_date}'"

     @search_pending+=@search

     @search_aproved+=@search



    @leave_requests_pending = LeaveRequest.joins(:employee).where(@search_pending).paginate(:page => params[:page],:per_page => 10).order("fromdate DESC")
    @leave_requests_approve = LeaveRequest.joins(:employee).where(@search_aproved).paginate(:page => params[:page],:per_page => 10).order("fromdate DESC")

  end

  def leave_cancel
    @leave_request = LeaveRequest.find(params[:id])
    @leave_request.status = "Cancelled";

    respond_to do |format|
      if @leave_request.update_attributes(params[:leave_request])

        @employees = Employee.find(session[:user_id])
        @manager = Employee.find(@leave_request.managerid)
        if session[:location_id] == 1
        @hr = Employee.find(7)
        elsif session[:location_id] == 2
        @hr = Employee.find(8)
        else
        @hr = Employee.find(3)
        end

        UserMailer.welcome_email(@manager,@leave_request,@employees,'Leave Cancelled', @manager.email).deliver
        if  @leave_request.status =='Approved'
        UserMailer.welcome_email(@manager,@leave_request,@employees,'Leave Cancelled', @hr.email).deliver
        end
        

        format.html { redirect_to leave_requests_path, notice: 'Leave request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "leave_requests_path" }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end

  end


  def leave_approve
    @leave_request = LeaveRequest.find(params[:id])
    @total_leaves=LeaveRequest.where( "  ( ( fromdate >= '#{Date.today.beginning_of_year.to_formatted_s(:db) }'  AND fromdate <='#{Date.today.end_of_year.to_formatted_s(:db)}') OR ( todate >= '#{Date.today.beginning_of_year.to_formatted_s(:db) }'  AND todate <='#{Date.today.end_of_year.to_formatted_s(:db)}') )  AND employee_id='#{@leave_request.employee_id}' AND id!='#{params[:id]}' AND (status='Approved' or status='Commited')");
    @leave_employee= @leave_request.employee
    @employee_m=employee_module(@leave_request.employee_id);
     
    #raise Date.today.beginning_of_year.to_formatted_s(:db).inspect
  
    
  end

  def leave_approve_update

    @leave_request = LeaveRequest.find(params[:id])
    @leave_request.fromdate= params[:fromdate]
    @leave_request.todate= params[:todate]
    @leave_request.status= params[:status]
    @leave_request.resumeon= params[:resumeon]
    @leave_request.numdays= params[:numdays]
    @leave_request.remarks= params[:remarks]
 


    respond_to do |format|
      if @leave_request.update_attributes(params[:leave_request])
        @employees = Employee.find(params[:employee_id])
        @manager = Employee.find(@leave_request.managerid)
       if session[:location_id] == 1
        @hr = Employee.find(7)
        elsif session[:location_id] == 2
        @hr = Employee.find(8)
        else
        @hr = Employee.find(3)
        end
        UserMailer.welcome_email(@manager,@leave_request,@employees,'Applied Leave Status', @employees.email).deliver  
        if  @leave_request.status =='Approved'
        UserMailer.welcome_email(@manager,@leave_request,@employees,'Applied Leave Status', @hr.email).deliver
        end      
       # UserMailer.welcome_email(@manager,@leave_request,@employees,'Applied Leave Status', @hr.email).deliver                
        format.html { redirect_to employee_leaves_path, notice: 'Leave request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "leave_approve_path" }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end

  end

end
