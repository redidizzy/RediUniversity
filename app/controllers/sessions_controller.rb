class SessionsController < ApplicationController

  skip_before_action :require_user, except: [ :destroy ]

  def new 
  end

  def create
    student = Student.find_by(email: params[:session][:email])
    if student and student.authenticate(params[:session][:password])
      session[:student_id] = student.id
      flash[:notice] = "You have successfully logged in"
      redirect_to student
    else
      flash.now[:error] = "Something was wrong with your login informations"
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

end