# frozen_string_literal: true

class AddColumnToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :realized_at, :datetime
  end
end
