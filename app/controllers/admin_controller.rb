class AdminController < ApplicationController

 
  before_filter :authenticate_admin!

  def index
   redirect_to admin_employees_path
  end

  private

  def authenticate_admin!    
    unless session[:roles].include?(1)
      flash[:error] = 'Your not an admin user'
      redirect_to root_path
    end



  end



end
