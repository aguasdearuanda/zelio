# frozen_string_literal: true

class CreateSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :situations do |t|
      t.boolean :active, default: true
      t.text    :reason
      t.integer :klass_id
      t.integer :student_id

      t.timestamps
    end
  end
end
