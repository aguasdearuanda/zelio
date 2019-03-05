# frozen_string_literal: true

class CreateJoinTableAttendancesStudents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :attendances, :students do |t|
      t.index %i[attendance_id student_id]
      t.index %i[student_id attendance_id]
    end
  end
end
