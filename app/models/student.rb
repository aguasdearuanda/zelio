# frozen_string_literal: true

class Student < ApplicationRecord
  has_and_belongs_to_many :klasses
  has_and_belongs_to_many :attendances
end
