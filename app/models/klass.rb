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
end
