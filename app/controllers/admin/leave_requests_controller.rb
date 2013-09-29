class Admin::LeaveRequestsController < AdminController




before_filter :authorize

  def index
 
    if params[:status_search].present? && params[:status_search]=='All'     
      @search=" employee_id>0 "
      @search_heading='';    
    elsif params[:status_search].present?     
      @search="status =  '#{params[:status_search]}'"
      @search_heading=params[:status_search];
    else
      @search = "status = 'Approved'"
      @search_heading='Approved'
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
     if params[:id].present?
      @search+=" AND employee_id >= '#{params[:id]}'"
     end
     if session[:roles].include?(4) == false
      @search+=" AND location_id >= '#{session[:location_id]}'"
     end
    
  #@leave_requests=LeaveRequest.joins(:employee).select('leave_requests.*,(select sum(els) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as els  ,(select sum(nels) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as nels ,(select sum(lops) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as lops,(select sum(compoffs) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as compoffs').where(@search).paginate(:page => params[:page],:per_page => 10).order("fromdate DESC")
    @leave_requests=LeaveRequest.joins(:employee).where(@search).paginate(:page => params[:page],:per_page => 10).order("fromdate DESC")


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leave_requests }
    end
  end


  # GET /leave_requests/1
  # GET /leave_requests/1.json
 # def show
   # @leave_request = LeaveRequest.find(params[:id])

   # respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @leave_request }
   # end
  #end

  # GET /leave_requests/new
  # GET /leave_requests/new.json
  def new
    @employees=Employee.find(session[:user_id]);
    @leave_request = LeaveRequest.new    
    @manager_list=Employee.joins(:employee_roles).where('employees_roles.role_id=3');
    @options='';
    @manager_list.each do |manager| 
    @options+="[#{manager.id}, #{manager.first_name+'  '+manager.last_name}],"   
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
    #@employees = Employee.find(params[:id])
    @leave_request = LeaveRequest.find(params[:id])
    @employees = Employee.find(@leave_request.employee_id)
    @manager_list=Employee.joins(:employee_roles).where('employees_roles.role_id=3');
    @employee_m=employee_module(@leave_request.employee_id);
   
  end

  # POST /leave_requests
  # POST /leave_requests.json
  def create

    @leave_request = LeaveRequest.new(params[:leave_request])
    @leave_request.status = "Pending";
    @leave_request.managerid = params[:manager_id];

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

    respond_to do |format|
      if @leave_request.update_attributes(params[:leave_request])
         
        @employees = Employee.find(@leave_request.employee_id)
        @manager = Employee.find(@employees.id)
        UserMailer.welcome_email(@manager,@leave_request,@employees,'Updated Leave Details By Admin',@employees.email).deliver
        UserMailer.welcome_email(@manager,@leave_request,@employees,'Updated Leave Details By Admin',@manager.email).deliver
        format.html { redirect_to admin_request_update_url, notice: 'Leave request was successfully updated.' }
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
   
    if params[:path] == "1"
    @cus_request_path=admin_applied_leaves_path(:id=>@leave_request.employee_id,:status_search=>params[:status_search],:path=>'1')
    elsif params[:path] == "2"
    @cus_request_path=admin_leave_requests_path(:status_search=>params[:status_search],:fromdate=>params[:fromdate],:todate=>params[:todate],:path=>'2')
    end

    respond_to do |format|
      if @leave_request.update_attributes(params[:leave_request])

        @employees = Employee.find(@leave_request.employee_id)
        @manager = Employee.find(@employees.manager_id)
        UserMailer.welcome_email(@manager,@leave_request,@employees,'Updated Leave Details By Admin', @employees.email).deliver
        UserMailer.welcome_email(@manager,@leave_request,@employees,'Updated Leave Details By Admin', @manager.email).deliver
        
        format.html { redirect_to @cus_request_path, notice: 'Leave request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "leave_requests_path" }
        format.json { render json: @cus_request_path.errors, status: :unprocessable_entity }
      end
    end

  end


  def leave_approve
    @leave_request = LeaveRequest.find(params[:id])
    @leave_employee= @leave_request.employee

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
        @manager = Employee.find(@employees.manager_id)
        UserMailer.welcome_email(@manager,@leave_request,@employees,'Applied Leave Status', @employees.email).deliver
        format.html { redirect_to request_update_path, notice: 'Leave request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "leave_approve_path" }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end

  end

  def applied_leaves
     
     
if params[:status_search].present? && params[:status_search]=='All'     
      @search="employee_id>0"
      @search_heading='';    
    elsif params[:status_search].present?     
      @search="status =  '#{params[:status_search]}'"
      @search_heading=params[:status_search];
    else
      @search = "status = 'Approved'"
      @status_search = "Approved"
      @search_heading='Approved'
    end    
     if params[:id].present?
      @search+=" AND employee_id = '#{params[:id]}'"
     end
     
  @employee=Employee.find(params[:id])
  #@leave_requests=LeaveRequest.joins(:employee,:processed_leave).select('leave_requests.*, sum(els) as total_els,sum(nels) as total_nels,sum(lops) as total_lops,sum(lops) as total_compoffs').where(@search).paginate(:page => params[:page],:per_page => 10).group("leave_requests.id,processed_leaves.leave_request_id").order("leave_requests.fromdate DESC")

 @leave_requests=LeaveRequest.joins(:employee).select('leave_requests.*,(select sum(els) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as els  ,(select sum(nels) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as nels ,(select sum(lops) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as lops,(select sum(compoffs) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as compoffs').where(@search).paginate(:page => params[:page],:per_page => 10).order("leave_requests.fromdate DESC")

  #raise @leave_requests.size.inspect

  #@processedleave=ProcessedLeave.find_by_leave_id(1);
  end

  def commit_leave
   @leave_request = LeaveRequest.select('leave_requests.*,(select sum(els) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as els  ,(select sum(nels) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as nels ,(select sum(lops) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as lops,(select sum(compoffs) From processed_leaves Where  leave_requests.id=processed_leaves.leave_request_id) as compoffs').find(params[:id])   
   @employee = Employee.joins(:leafe).find(@leave_request.employee_id)       
   @manager = Employee.find(@employee.manager_id)
   @employee_m=employee_module(@leave_request.employee_id);
   #@employee.build_leafe 
   
  end
  
  
def leave_request_commit
   @leave_request =LeaveRequest.find(params[:id])  
   @leafe = Leafe.find_by_employee_id(@leave_request.employee_id)     
   #@employee.build_leafe 
   if params[:commit] == 'Commit'
    @leave_request.status = "Commited";   
   else
   @leave_request.status = "Approved";   
   end  
   
 
  
   @processed_leave = ProcessedLeave.new
   @leaves_audit_logs = LeavesAuditLog.new
   @processed_leave.els=params[:employee][:leafe_attributes][:els]
   @processed_leave.nels=params[:employee][:leafe_attributes][:nels]
   @processed_leave.lops=params[:employee][:leafe_attributes][:lops]
   @processed_leave.compoffs=params[:employee][:leafe_attributes][:compoffs]
   @processed_leave.leave_request_id=params[:id]
   @processed_leave.processed_by=session[:user_id]

   @leaves_audit_logs.preels=params[:els]
   @leaves_audit_logs.prenels=params[:nels]
   @leaves_audit_logs.prelops=params[:lops]
   @leaves_audit_logs.precompoffs=params[:compoffs]
   @leaves_audit_logs.employee_id=@leave_request.employee_id
   @leaves_audit_logs.currentels=params[:employee][:leafe_attributes][:els]
   @leaves_audit_logs.currentnels=params[:employee][:leafe_attributes][:nels]
   @leaves_audit_logs.currentlops=params[:employee][:leafe_attributes][:lops]
   @leaves_audit_logs.currentcompoffs=params[:employee][:leafe_attributes][:compoffs]
   @leaves_audit_logs.premodifiedby=session[:user_id]
   @leaves_audit_logs.tableorscreen='leave commit'
   
   


   @leafe.els =@leafe.els-params[:employee][:leafe_attributes][:els].to_d
   @leafe.nels=@leafe.nels-params[:employee][:leafe_attributes][:nels].to_d   
   @leafe.lops=(@leafe.lops!="" ? @leafe.lops : 0.00 )+params[:employee][:leafe_attributes][:lops].to_d
   @leafe.compoffs=(@leafe.compoffs!="" ? @leafe.compoffs : 0.00)+params[:employee][:leafe_attributes][:compoffs].to_d
  
    if params[:path] == "1"
    @cus_request_path=admin_applied_leaves_path(:id=>@leave_request.employee_id,:status_search=>params[:status_search],:path=>'1')
    elsif params[:path] == "2"
    @cus_request_path=admin_leave_requests_path(:status_search=>params[:status_search],:fromdate=>params[:fromdate],:todate=>params[:todate],:path=>'2')
    end
   


 respond_to do |format|
      if @leafe.update_attributes(params[:leafe_attributes])  && @leave_request.update_attributes(params[:leave_request])
         @processed_leave.save
         @leaves_audit_logs.tableid=@processed_leave.id
         @leaves_audit_logs.save
         @employees=Employee.find(@leave_request.employee_id);
         @manager=Employee.find(@employees.manager_id);
         if params[:commit] == 'Commit'
          @prole=ProcessedLeave.select('processed_leaves .*, sum(els) as pels,sum(nels) as pnels ,sum(lops) as plops,sum(compoffs) as pcompoffs').find_by_leave_request_id(params[:id]);


          @leafeatt={} 
	  @leafeatt['els']=@prole.pels == 0.0 ||  @prole.pels == '' ?   '' : @prole.pels
	  @leafeatt['nels']=@prole.pnels == 0.0 ||  @prole.pnels == '' ?   '' : @prole.pnels
	  @leafeatt['lops']=@prole.plops == 0.0 ||  @prole.plops == '' ?   '' : @prole.plops
	  @leafeatt['compoffs']=@prole.pcompoffs == 0.0 ||  @prole.pcompoffs == '' ?   '' : @prole.pcompoffs 
          #raise  @leafeatt.inspect 
         UserMailer.commit_email(@manager,@leave_request,@employees,@leafeatt,'Updated Leave Details By Admin', @employees.email).deliver     
        end 
        format.html { redirect_to @cus_request_path, notice: 'Leave request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "leave_approve_path" }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end

 end


 def forcedleave 

 
   @search=" employees.id >0 "
   if session[:roles].include?(4) == false
   @search+=" AND location_id = '#{session[:location_id]}'"
   end
   
   if params[:empid].present?
      @search+=" AND empid LIKE '%#{params[:empid]}%'"
    end
   
    if params[:first_name].present?
      @search+=" AND (first_name LIKE '%#{params[:first_name]}%' OR  last_name LIKE '%#{params[:first_name]}%')"
    end
    
    @employees = Employee.joins(:leafe).where(@search).paginate(:page => params[:page],:per_page => 10).order("employees.empid ASC")


    respond_to do |format|
   
      format.html # index.html.erb
      format.json { render json: @employees }
    end

 end

 def addforcedleave 
   
   if params[:commit]=="Commit"  

@leafe = Leafe.find_by_employee_id(params[:id]) 
  @leafeatt={} 
  @leafeatt['els']=params[:employee][:leafe_attributes][:els]
  @leafeatt['nels']=params[:employee][:leafe_attributes][:nels]
  @leafeatt['lops']=params[:employee][:leafe_attributes][:lops]
  @leafeatt['compoffs']=params[:employee][:leafe_attributes][:compoffs]
  
   @processed_leave = ProcessedLeave.new
   @leaves_audit_logs = LeavesAuditLog.new
   @processed_leave.els=params[:employee][:leafe_attributes][:els]
   @processed_leave.nels=params[:employee][:leafe_attributes][:nels]
   @processed_leave.lops=params[:employee][:leafe_attributes][:lops]
   @processed_leave.compoffs=params[:employee][:leafe_attributes][:compoffs]
   @processed_leave.leave_request_id=params[:id]
   @processed_leave.processed_by=session[:user_id]

   @leaves_audit_logs.preels=params[:els]
   @leaves_audit_logs.prenels=params[:nels]
   @leaves_audit_logs.prelops=params[:lops]
   @leaves_audit_logs.precompoffs=params[:compoffs]
   @leaves_audit_logs.employee_id=params[:id]
   @leaves_audit_logs.currentels=params[:employee][:leafe_attributes][:els]
   @leaves_audit_logs.currentnels=params[:employee][:leafe_attributes][:nels]
   @leaves_audit_logs.currentlops=params[:employee][:leafe_attributes][:lops]
   @leaves_audit_logs.currentcompoffs=params[:employee][:leafe_attributes][:compoffs]
   @leaves_audit_logs.premodifiedby=session[:user_id]
   @leaves_audit_logs.tableorscreen='forced-leave'
   
   
   #raise @leafe.els.inspect
   #@leafe.els.nil?   ?    @leafe.els : 0.00 
   # raise @leafe.els.inspect
   @leafe.els =(@leafe.els.nil? ?  0.00 : @leafe.els )-params[:employee][:leafe_attributes][:els].to_d
   #raise @leafe.els.inspect
   @leafe.nels=(@leafe.nels.nil? ? 0.00 : @leafe.nels )-params[:employee][:leafe_attributes][:nels].to_d   
   @leafe.lops=(@leafe.lops.nil? ? 0.00 : @leafe.lops )+params[:employee][:leafe_attributes][:lops].to_d
   @leafe.compoffs=(@leafe.compoffs.nil? ? 0.00 : @leafe.compoffs)+params[:employee][:leafe_attributes][:compoffs].to_d
    

    
      if @leafe.update_attributes(params[:leafe_attributes])
         @processed_leave.save 
         @leaves_audit_logs.tableid= @processed_leave.id        
         @leaves_audit_logs.save
         @employees=Employee.find(params[:id]);
         @manager=Employee.find(@employees.manager_id);
        #UserMailer.commit_email(@manager,@leave_request,@employees,@leafeatt,'Updated Leave Details By Admin', @employees.email).deliver
       
        render :text => '<script type="text/javascript">window.opener.location.reload();window.close();</script>'
    
       end
   
  else
 @employee= Employee.find(params[:id])
 @employee_m=employee_module(params[:id]); 
   render layout: false 

 end
   

end
 


end
