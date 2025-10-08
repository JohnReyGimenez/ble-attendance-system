class CreateAttendanceRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :attendance_records do |t|
      t.references :student, null: false, foreign_key: true
      t.string :status
      t.datetime :timestamp

      t.timestamps
    end
  end
end
