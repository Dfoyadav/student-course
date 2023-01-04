class StudentsController < ApplicationController

  def index
    @students = Student.where('name LIKE ?',"#{params[:name]}%")if params[:name].present?
    @students = Student.all if !params[:name].present?
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "This Student create successfully"
      redirect_to root_path
    else
      render :new
    end
  end  

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to root_path
  end


  private

    def student_params
       params.require(:student).permit(:name,:course_id)
    end

end