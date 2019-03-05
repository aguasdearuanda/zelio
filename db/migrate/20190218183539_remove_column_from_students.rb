# frozen_string_literal: true

class RemoveColumnFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :active
    remove_column :students, :disabled_at
    remove_column :students, :attended
  end
end
