module Api
  module V1
    class AttendancesController < ApplicationController
      # skip authenticity token
      skip_before_action :verify_authenticity_token

      # POST /api/v1/attendances
      def create
        attendance = AttendanceRecord.new(attendance_params)

        if attendance.save
          render json: { message: "Attendance recorded successfully!" }, status: :created
        else
          render json: { errors: attendance.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        render json: Attendance.all
      end

      private

      def attendance_params
        params.require(:attendance_record).permit(:student_id, :status, :timestamp)
      end
    end
  end
end
