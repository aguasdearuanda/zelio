class CreateJoinTableAttendancesKlasses < ActiveRecord::Migration[5.2]
  def change
    create_join_table :attendances, :klasses do |t|
      t.index [:attendance_id, :klass_id]
      t.index [:klass_id, :attendance_id]
    end
  end
end
