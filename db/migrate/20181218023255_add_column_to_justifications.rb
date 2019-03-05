# frozen_string_literal: true

class AddColumnToJustifications < ActiveRecord::Migration[5.2]
  def change
    add_column :justifications, :status, :string, default: 'pendente'
  end
end
