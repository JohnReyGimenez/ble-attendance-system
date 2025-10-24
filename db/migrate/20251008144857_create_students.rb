class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :student_id_number
      t.string :block

      t.timestamps
    end
  end
end
