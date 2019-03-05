# frozen_string_literal: true

class AddColumnNameToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :name, :string
  end
end
