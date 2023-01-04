class CoursesController < ApplicationController
  def index
    @courses = Course.all

    respond_to do |format|
      format.html
      format.csv { send_data @courses.to_csv, filename: "courses-#{Date.today}.csv" }
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
    	flash[:notice] = " Course create successfully"
      redirect_to @course
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to root_path
  end


  def qr_code_generator
    qr_code('inline')
  end

  def qr_code_download
    qr_code('attachment')
  end  

  private
    def course_params
      params.require(:course).permit(:name, :duration,:qr_code_generator,:send_message)
    end

    def qr_code(disposition)
      @course = Course.find(params[:id])
      send_data RQRCode::QRCode.new(@course.as_json.to_s).as_png(size: 300), type: 'image/png', disposition: disposition
    end
  
end
