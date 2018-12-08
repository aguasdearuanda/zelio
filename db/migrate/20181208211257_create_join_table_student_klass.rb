class CreateJoinTableStudentKlass < ActiveRecord::Migration[5.2]
  def change
    create_join_table :students, :klasses do |t|
      t.index %i[student_id klass_id]
      t.index %i[klass_id student_id]
    end
  end
end
