class CoursesController < ApplicationController

  skip_before_action :require_user, only: [ :index ]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create 
    @course = Course.new(course_params)
    if @course.save 
      flash[:notice] = "The course #{@course.name} has been created successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private 

  def course_params
    params.require(:course).permit(:name, :short_name, :description)
  end
end
