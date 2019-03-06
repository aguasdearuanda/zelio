# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_and_belongs_to_many :klasses
  validates :name, presence: true
end
