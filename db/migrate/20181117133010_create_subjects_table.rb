# frozen_string_literal: true

class CreateSubjectsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :title
      t.integer :teacher_id
      t.integer :group_id
    end
  end
end
