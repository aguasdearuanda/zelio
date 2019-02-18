# frozen_string_literal: true

class Student < ApplicationRecord
  has_and_belongs_to_many :klasses
  has_and_belongs_to_many :attendances
  has_many :situations

  def count_presence(attendances, klass)
    count = 0

    if self.situations.where(klass_id: klass).present?
      count = period_attendances(attendances)
    else
      attendances.each do |attended|
        count += 1 if attended.students.where(id: self.id).size == 0
      end
    end

    count
    # count = (count.to_f/attendances.size.to_f*100)
    # convert_to_percentage(count)
  end

  def period_attendances(attendances)
    count = 0
    period = attendances.where('realized_at <= ?', self.situations.first.created_at)
    period.each do |attended|
      count += 1 if attended.students.where(id: self.id).size == 0
    end
    count
  end
end
