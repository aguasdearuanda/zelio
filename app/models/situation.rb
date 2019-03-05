# frozen_string_literal: true

class Situation < ApplicationRecord
  belongs_to :klass
  belongs_to :student
end
