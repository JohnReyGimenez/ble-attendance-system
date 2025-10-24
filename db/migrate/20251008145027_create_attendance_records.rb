class CreateAttendanceRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :attendance_records do |t|
      t.references :student, null: false, foreign_key: true
      t.string :mac_address
      t.string :event_type
      t.datetime :timestamp

      t.timestamps
    end
  end
end
