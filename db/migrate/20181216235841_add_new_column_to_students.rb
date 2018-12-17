class AddNewColumnToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :attended, :boolean
  end
end
