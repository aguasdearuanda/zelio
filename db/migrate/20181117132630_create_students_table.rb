# frozen_string_literal: true

class CreateStudentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile_phone
      t.integer :group_id
    end
  end
end
