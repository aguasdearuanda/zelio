class AddFlagToKlass < ActiveRecord::Migration[6.0]
  def change
    add_column :klasses, :active, :boolean, default: true
  end
end
