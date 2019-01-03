# frozen_string_literal: true

class Student < ApplicationRecord
  has_and_belongs_to_many :klasses
  has_and_belongs_to_many :attendances

  def count_presence(attendances)
    count = 0
    match = attendances.size - self.attendances.size
    count =+ match
    count
  end
end
