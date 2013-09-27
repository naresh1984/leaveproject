class UserMailer < ActionMailer::Base

default from: "from@example.com"

  def welcome_email(manager,leave_requests,employees,leave_heading,email_to)
    @manager = manager
    @leave_requests = leave_requests
    @employees = employees
    @leave_heading  =leave_heading
    @email_to  =email_to

    @url  = 'http://example.com/login'
    mail(to:@email_to,
         subject: @leave_heading) do |format|
      format.html { render 'user_mailer/manager' }

    end

  end

def registration_email(employee,leave_heading,email_to)   
    @employees = employee
    @leave_heading  =leave_heading
    @email_to  =email_to
    @url  = 'http://example.com/login'
    mail(to:@email_to,
         subject: @leave_heading) do |format|
      format.html { render 'user_mailer/registration' }

    end

  end

def commit_email(manager,leave_requests,employees,leafe,leave_heading,email_to)   
    @employees = employees
    @leave_requests = leave_requests
    @leave_heading  =leave_heading
    @leafe  =leafe
    @email_to  =email_to
    @url  = 'http://example.com/login'
    mail(to:@email_to,
         subject: @leave_heading) do |format|
      format.html { render 'user_mailer/commit' }

    end

  end



end
