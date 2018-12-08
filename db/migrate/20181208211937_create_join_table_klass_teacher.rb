# frozen_string_literal: true

class CreateJoinTableKlassTeacher < ActiveRecord::Migration[5.2]
  def change
    create_join_table :klasses, :teachers do |t|
      t.index %i[klass_id teacher_id]
      t.index %i[teacher_id klass_id]
    end
  end
end
