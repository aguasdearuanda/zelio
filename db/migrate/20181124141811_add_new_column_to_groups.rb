class AddNewColumnToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :created_at, :datetime
    add_column :groups, :updated_at, :datetime
  end
end
