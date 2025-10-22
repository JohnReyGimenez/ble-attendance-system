class AttendanceRecordsController < ApplicationController
  # skip authenticity check for API use
  skip_before_action :verify_authenticity_token

  # POST /attendance
  def create
    tag = Tag.find_by(mac_address: params[:mac_address])
    return render json: { error: "Tag not found" }, status: :not_found unless tag

    student = tag.student
    return render json: { error: "No student linked to this tag" }, status: :unprocessable_entity unless student

    attendance = AttendanceRecord.new(
      student: student,
      mac_address: params[:mac_address],
      event_type: params[:event_type],
      timestamp: params[:timestamp]
    )

    if attendance.save
      render json: {
        message: "Attendance recorded successfully!",
        student: student.name,
        event_type: attendance.event_type,
        timestamp: attendance.timestamp
      }, status: :created
    else
      render json: { errors: attendance.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /attendance_records
  def index
    records = AttendanceRecord.includes(:student).order(created_at: :desc)
    render json: records.as_json(
      include: { student: { only: [ :id, :name ] } },
      only: [ :id, :event_type, :mac_address, :timestamp ]
    )
  end

  def show
    @attendance_records = AttendanceRecord.find(params[:id])
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
