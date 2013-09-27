class Admin::LeavesController < AdminController

def edit
@leafe = Leafe.find_by_employee_id(params[:id])
@employee=Employee.find(params[:id]);
end


 def update
    @leafe = Leafe.find_by_employee_id(params[:id])
    respond_to do |format|
      if @leafe.update_attributes(params[:leafe])
        format.html { redirect_to edit_admin_leafe_path, notice: 'Leafe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: edit_admin_leafe_path.errors, status: :unprocessable_entity }
      end
    end
  end



end
