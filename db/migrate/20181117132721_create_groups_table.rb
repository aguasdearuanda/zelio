# frozen_string_literal: true

class CreateGroupsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
    end
  end
end
