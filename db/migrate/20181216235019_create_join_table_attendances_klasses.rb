# frozen_string_literal: true

class CreateJoinTableAttendancesKlasses < ActiveRecord::Migration[5.2]
  def change
    create_join_table :attendances, :klasses do |t|
      t.index %i[attendance_id klass_id]
      t.index %i[klass_id attendance_id]
    end
  end
end
