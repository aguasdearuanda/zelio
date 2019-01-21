class AddColumnToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :active, :boolean, default: true
    add_column :students, :disabled_at, :datetime
  end
end
