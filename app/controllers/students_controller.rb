class StudentsController < ApplicationController

  before_action :set_student, only: [ :show, :edit, :update ]

  skip_before_action :require_user, only: [ :new, :create ]

  def index 
    @students = Student.all
  end

  def new 
    @student = Student.new
  end

  def create
    @student = Student.new student_params
    if @student.save
      flash[:notice] = "You have successfully signed up"
      redirect_to @student
    else
      render 'new'
    end
  end

  def update 
    if @student.update(student_params)
      flash[:notice] = "You have successfully updated your profile"
      redirect_to @student
    else
      render 'new'
    end

  end

  def show 
  end

  def edit 
  end

  private 

  def student_params 
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_student
    @student = Student.find(params[:id])
  end

end