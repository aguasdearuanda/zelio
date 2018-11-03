# frozen_string_literal: true

class CreateAttendancesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.integer :student_id
      t.integer :subject_id
      t.boolean :attended
    end
  end
end
