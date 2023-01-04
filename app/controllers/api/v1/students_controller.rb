class Api::V1::StudentsController < ApplicationController
  def index
  	student = Student.where(name: params[:name])
    if student.present?
      render json: {data: student},status:200
    else
    	students = Student.all
      render json: {data: students},status:200
    end
  end
end





