class ApplicationController < ActionController::Base
 protect_from_forgery
 helper :all
 before_filter :authorize
 helper_method :authenticate_admin
 helper_method :employee_module


 
def employee_module (id)
 d = Date.today 
@search=" employee_id= '#{id}' "
@search1=" AND  leave_requests.fromdate >= '#{d.at_beginning_of_month.to_formatted_s(:db)}'"
@employee_module=Leafe.select('leaves.*,(select count(*) From leave_requests Where  leave_requests.employee_id=leaves.employee_id  AND  leave_requests.fromdate >= "'+d.at_beginning_of_month.to_formatted_s(:db)+'" AND  leave_requests.status!="Cancelled" AND  leave_requests.status!="Commited"  ) as count').find_by_employee_id(id);
return @employee_module
end




protected
def authorize
unless Employee.find_by_id(session[:user_id])
redirect_to login_url, notice: "Please log in"
end
end

 


end
