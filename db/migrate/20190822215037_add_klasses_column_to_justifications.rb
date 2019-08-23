class AddKlassesColumnToJustifications < ActiveRecord::Migration[5.2]
  def change
    add_column :justifications, :klass, :integer
  end
end
