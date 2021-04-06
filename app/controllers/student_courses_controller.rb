class StudentCoursesController < ApplicationController

  def create
    course = Course.find(params[:id])
    unless !course or current_user.courses.include?(course)
      current_user.courses << course
      flash[:notice] = "You have successfully enrolled in #{course.name}"
      redirect_to current_user
    else
      flash[:error] = "Something was wrong with your enrollment"
      redirect_to root_path
    end
  end

end