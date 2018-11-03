# frozen_string_literal: true

class CreateTeachersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile_number
    end
  end
end
