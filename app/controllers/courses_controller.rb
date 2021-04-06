class CoursesController < ApplicationController

  skip_before_action :require_user, only: [ :index ]

  before_action :set_course, only: [ :show, :update, :edit ]

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
  def show 
  end

  private 

  def course_params
    params.require(:course).permit(:name, :short_name, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
