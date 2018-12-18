class CreateJustifications < ActiveRecord::Migration[5.2]
  def change
    create_table :justifications do |t|
      t.string :name
      t.string :email
      t.text :description
      t.datetime :date
      t.timestamps
    end
  end
end
