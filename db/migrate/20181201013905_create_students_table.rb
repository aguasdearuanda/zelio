# frozen_string_literal: true

class CreateStudentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :birthday

      t.timestamps
    end
  end
end
