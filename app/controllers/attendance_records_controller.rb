class AttendanceRecordsController < ApplicationController
  def index
    @attendance_records = AttendanceRecord.all
    render json: @attendance_records
  end

  def show
    @attendance_records = AttendanceRecord.find(params[:id])
    render json: @attendance_records
  end

  def create
    @attendance_records = AttendanceRecord.create(
        timestamp: params[:timestamp],
        status: params[:status],
        student: params[:student]
    )
    render json: @attendance_records
  end

  def update
    @attendance_records = AttendanceRecord.find(params[:id])
    @secretMenuItem.update(
      timestamp: params[:timestamp],
      status: params[:status],
      student: params[:student]
    )
    render json: @attendance_records
  end

  def destroy
    @attendance_records = AttendanceRecord.all
    @attendance_records = AttendanceRecord.find(params[:id])
    @attendance_records.destroy
     render json: @attendance_records
  end
end
