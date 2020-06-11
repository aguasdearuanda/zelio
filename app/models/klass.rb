# frozen_string_literal: true

class Klass < ApplicationRecord
  has_and_belongs_to_many :students
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :attendances
  has_many :situations
  validates :name, presence: true

  def disable_student(student)
    situations.create(klass_id: self, student_id: student, active: false)
  end

  def disable
    update(active: false)
  end

  def active_students
    students = []

    self.students.each do |student|
      students << student if student.situations.empty?
    end

    students.sort
  end

  def birthday_list
    students = []

    list = self.students.where('extract(month from birthday) = ?', Time.zone.today.month)
    list.each do |student|
      students << student if student.situations.empty?
    end

    students.sort
  end
end
