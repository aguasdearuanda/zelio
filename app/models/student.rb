# frozen_string_literal: true

class Student < ApplicationRecord
  has_and_belongs_to_many :klasses
  has_and_belongs_to_many :attendances
  has_many :situations

  def count_presence(attendances, klass)
    count = 0
    count = if situations.where(klass_id: klass).present?
              period = attendances.where('realized_at <= ?', situations.first.created_at)
              period_attendances(period)
            else
              period = attendances.where('realized_at >= ?', created_at)
              period_attendances(period)
            end
    count
    # count = (count.to_f/attendances.size.to_f*100)
    # convert_to_percentage(count)
  end

  def period_attendances(period)
    # 1st scenario: the student was disabled so the next classes attendance,
    # should not be counted.
    # 2nd scenario: the student joined on the group days later after began
    # the first class then we should not count the classes attendances behind
    # the day that he joined the group klass.
    count = 0
    period.each do |attended|
      count += 1 if attended.students.where(id: id).empty?
    end
    count
  end

  def show_attendances(attendances, klass)
    attendance = []
    period = check_presence(attendances, klass)
    period.each do |klasses|
      attendance << klasses.name if klasses.students.where(id: id).empty?
    end
    attendance.join('<br>').html_safe
  end

  def check_presence(attendances, klass)
    period = if situations.where(klass_id: klass).present?
               attendances.where('realized_at <= ?', situations.first.created_at)
             else
               attendances.where('realized_at >= ?', created_at)
             end
  end
end
