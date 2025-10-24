class StudentsController < ApplicationController
  def index
    @students = Student.all
    render json: @students
  end

  def show
    @student = Student.find(params[:id])
    render json: @student, include: :tag
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    head :no_content
  end

  def assign_tag
    @student = Student.find(params[:id])
    @tag = Tag.find_by(id: params[:tag_id])

    unless @tag
      render json: { error: "Tag not found" }, status: :not_found and return
    end

    @tag.update!(student: @student)
    render json: { student: @student, tag: @tag }
  end

  def unassign_tag
    @student = Student.find(params[:id])
    @tag = @student.tag
    
    unless @tag
      render json: { error: "No tag assigned to this student" }, status: :not_found and return
    end

    @tag.update!(student: nil)
    render json: { student: @student, tag: @tag }
  end

  private

  def student_params
    params.require(:student).permit(:name, :student_id_number)
  end
end
