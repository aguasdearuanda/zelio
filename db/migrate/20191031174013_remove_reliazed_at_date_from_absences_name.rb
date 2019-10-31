class RemoveReliazedAtDateFromAbsencesName < ActiveRecord::Migration[5.2]
  def change
    Attendance.all.each do |at|
      name = at.name.gsub(%r{\d{2}\/\d{2}\/\d{2,4}}, '').rstrip
      at.update(name: name)
    end
  end
end
