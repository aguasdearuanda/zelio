# frozen_string_literal: true

class Attendance < ApplicationRecord
  has_and_belongs_to_many :students
  has_and_belongs_to_many :klasses
  validates :name, presence: true
end
